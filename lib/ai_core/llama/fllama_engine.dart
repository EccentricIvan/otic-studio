import 'dart:async';

import 'package:fllama/fllama.dart';

class FllamaEngine {
  double? _contextId;
  StreamSubscription<Map<Object?, dynamic>>? _tokenSubscription;

  bool get isLoaded => _contextId != null;

  Future<void> loadModel(
    String modelPath, {
    void Function(double? progress)? onProgress,
  }) async {
    if (_contextId != null) return;

    final llama = Fllama.instance();
    if (llama == null) {
      throw const FllamaEngineException('fllama is not available here.');
    }

    await _tokenSubscription?.cancel();
    _tokenSubscription = llama.onTokenStream?.listen((data) {
      if (data['function'] != 'loadProgress') return;
      final result = data['result'];
      onProgress?.call(_asProgress(result));
    });

    try {
      final result = await llama.initContext(
        modelPath,
        nCtx: 1024,
        nBatch: 256,
        nGpuLayers: 0,
        useMlock: false,
        useMmap: true,
        emitLoadProgress: true,
      );
      final id = _asDouble(result?['contextId']);
      if (id == null || id <= 0) {
        throw FllamaEngineException(
          'fllama could not initialize a context: $result',
        );
      }
      _contextId = id;
    } catch (e) {
      if (_looksLikeOutOfMemory(e)) {
        throw const FllamaEngineException(
          'The model did not fit in memory. Try a 64-bit device or a smaller quantization.',
        );
      }
      throw FllamaEngineException('Failed to load model: $e');
    }
  }

  Future<String> generate({
    required String prompt,
    int maxTokens = 256,
    double temperature = 0.7,
    void Function(String token)? onToken,
  }) async {
    final contextId = _contextId;
    if (contextId == null) {
      throw const FllamaEngineException(
        'Load the model before sending a prompt.',
      );
    }

    final llama = Fllama.instance();
    if (llama == null) {
      throw const FllamaEngineException('fllama is not available here.');
    }

    final buffer = StringBuffer();
    await _tokenSubscription?.cancel();
    _tokenSubscription = llama.onTokenStream?.listen((data) {
      if (data['function'] != 'completion') return;
      final token = _extractToken(data['result']);
      if (token == null || token.isEmpty) return;
      buffer.write(token);
      onToken?.call(token);
    });

    try {
      final result = await llama.completion(
        contextId,
        prompt: _formatLlama32Prompt(prompt),
        temperature: temperature,
        nPredict: maxTokens,
        topK: 40,
        topP: 0.9,
        penaltyRepeat: 1.08,
        stop: const ['<|eot_id|>', '<|end_of_text|>'],
        emitRealtimeCompletion: true,
      );

      if (buffer.isNotEmpty) return buffer.toString();

      final fallback = _extractText(result);
      if (fallback != null && fallback.isNotEmpty) return fallback;
      throw FllamaEngineException('Inference returned no text: $result');
    } catch (e) {
      if (_looksLikeOutOfMemory(e)) {
        throw const FllamaEngineException(
          'The device ran out of memory during inference.',
        );
      }
      throw FllamaEngineException('Inference failed: $e');
    }
  }

  Future<void> dispose() async {
    await _tokenSubscription?.cancel();
    _tokenSubscription = null;

    final contextId = _contextId;
    _contextId = null;
    if (contextId != null) {
      await Fllama.instance()?.releaseContext(contextId);
    }
  }

  static String _formatLlama32Prompt(String prompt) {
    return '<|begin_of_text|>'
        '<|start_header_id|>system<|end_header_id|>\n\n'
        'You are a concise on-device assistant running inside Otic Studio.'
        '<|eot_id|>'
        '<|start_header_id|>user<|end_header_id|>\n\n'
        '$prompt'
        '<|eot_id|>'
        '<|start_header_id|>assistant<|end_header_id|>\n\n';
  }

  static double? _asProgress(Object? value) {
    final numeric = _asDouble(value);
    if (numeric == null) return null;
    if (numeric > 1) return numeric / 100;
    return numeric;
  }

  static double? _asDouble(Object? value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static String? _extractToken(Object? value) {
    if (value is String) return value;
    if (value is Map) {
      final token = value['token'] ?? value['content'] ?? value['text'];
      if (token != null) return token.toString();
    }
    return null;
  }

  static String? _extractText(Object? value) {
    if (value is String) return value;
    if (value is Map) {
      for (final key in ['text', 'content', 'completion', 'result', 'token']) {
        final current = value[key];
        if (current == null) continue;
        final text = _extractText(current);
        if (text != null && text.isNotEmpty) return text;
      }
    }
    return null;
  }

  static bool _looksLikeOutOfMemory(Object error) {
    final lower = error.toString().toLowerCase();
    return lower.contains('outofmemory') ||
        lower.contains('out of memory') ||
        lower.contains('allocation failed') ||
        lower.contains('std::bad_alloc');
  }
}

class FllamaEngineException implements Exception {
  const FllamaEngineException(this.message);
  final String message;

  @override
  String toString() => message;
}
