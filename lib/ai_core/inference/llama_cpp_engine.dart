import 'inference_engine.dart';

/// Windows / Linux engine — llama.cpp via dart:ffi.
///
/// Phase 1: loads the model path, delegates generation to built-in mock
/// so the Learn screen works on desktop during development.
///
/// Phase 1b (next): replace _generate() with real FFI calls:
///   1. Build llama.cpp: cmake -B build -DLLAMA_CUBLAS=ON (GPU) or OFF (CPU)
///   2. Place llama.dll / libllama.so next to the app binary
///   3. Implement _LlamaBindings with dart:ffi + llama.h C API
class LlamaCppEngineImpl extends InferenceEngine {
  String? _loadedPath;

  @override
  bool get isReady => _loadedPath != null;

  @override
  String get backendLabel => 'llama.cpp · Gemma 3 1B Q4';

  @override
  Future<void> loadModel(String modelPath) async {
    // Phase 1b: dlopen llama.dll + llama_init_from_file(modelPath)
    _loadedPath = modelPath;
  }

  @override
  Future<String> generate({
    required String prompt,
    int maxTokens = 512,
    double temperature = 0.7,
    TokenCallback? onToken,
  }) async {
    if (_loadedPath == null) throw StateError('Model not loaded.');
    // Phase 1b: call llama_eval() and stream real tokens
    return _devPlaceholder(prompt, onToken: onToken);
  }

  Future<String> _devPlaceholder(String prompt, {TokenCallback? onToken}) async {
    const response =
        '[Desktop AI — llama.cpp FFI wiring coming in Phase 1b. '
        'Install the .gguf model and re-run to see real Gemma responses.]';
    for (final word in response.split(' ')) {
      final token = '$word ';
      onToken?.call(token);
      await Future.delayed(const Duration(milliseconds: 30));
    }
    return response;
  }

  @override
  Future<void> dispose() async {
    // Phase 1b: llama_free()
    _loadedPath = null;
  }
}
