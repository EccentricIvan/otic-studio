import 'package:flutter_gemma/flutter_gemma.dart';
import 'inference_engine.dart';

/// Android engine — Google LiteRT-LM runtime via flutter_gemma 0.4.x.
/// Runs Gemma 3 1B entirely on-device (GPU delegate when available).
class LiteRtLmEngineImpl extends InferenceEngine {
  final _plugin = FlutterGemmaPlugin.instance;
  bool _ready = false;

  @override
  bool get isReady => _ready;

  @override
  String get backendLabel => 'LiteRT-LM · Gemma 3 1B';

  @override
  Future<void> loadModel(String modelPath) async {
    try {
      // Load model from local file path (USB-transferred .bin file)
      await _plugin.loadAssetModel(fullPath: modelPath);
      // Initialise inference with sensible defaults
      await _plugin.init(
        maxTokens: 512,
        temperature: 0.7,
        topK: 40,
        randomSeed: 42,
      );
      _ready = true;
    } catch (e) {
      throw ModelLoadException('LiteRT-LM failed to load "$modelPath": $e');
    }
  }

  @override
  Future<String> generate({
    required String prompt,
    int maxTokens = 512,
    double temperature = 0.7,
    TokenCallback? onToken,
  }) async {
    if (!_ready) throw StateError('Model not loaded. Call loadModel() first.');

    final buffer = StringBuffer();
    await for (final token in _plugin.getResponseAsync(prompt: prompt)) {
      if (token != null && token.isNotEmpty) {
        buffer.write(token);
        onToken?.call(token);
      }
    }
    return buffer.toString();
  }

  @override
  Future<void> dispose() async {
    await _plugin.close();
    _ready = false;
  }
}
