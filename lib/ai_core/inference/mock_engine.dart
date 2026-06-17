import 'inference_engine.dart';

/// Development mock — instant responses without a real model file.
/// Used when running on desktop before llama.cpp FFI is wired up,
/// and in unit tests.
class MockEngine extends InferenceEngine {
  bool _ready = false;

  @override
  bool get isReady => _ready;

  @override
  String get backendLabel => 'Mock (dev only)';

  @override
  Future<void> loadModel(String modelPath) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _ready = true;
  }

  @override
  Future<String> generate({
    required String prompt,
    int maxTokens = 512,
    double temperature = 0.7,
    TokenCallback? onToken,
  }) async {
    return _mockResponse(prompt, onToken: onToken);
  }

  Future<String> _mockResponse(String prompt, {TokenCallback? onToken}) async {
    final response = _pickResponse(prompt);
    for (final word in response.split(' ')) {
      final token = '$word ';
      onToken?.call(token);
      await Future.delayed(const Duration(milliseconds: 40));
    }
    return response;
  }

  String _pickResponse(String prompt) {
    final lower = prompt.toLowerCase();
    if (lower.contains('photosynthesis')) {
      return 'Photosynthesis is how plants convert sunlight into food. '
          'Chlorophyll in the leaves absorbs light, which drives a reaction '
          'that turns carbon dioxide and water into glucose and oxygen. '
          'Now — can you tell me: what part of the plant cell does this happen in?';
    }
    if (lower.contains('python') || lower.contains('code')) {
      return 'Great choice! Python is one of the most beginner-friendly languages. '
          'Let\'s start with the basics: a variable stores a value. '
          'Try this: `name = "Tutor"` then `print(name)`. '
          'What do you think will happen when you run it?';
    }
    if (lower.contains('entrepreneur')) {
      return 'Entrepreneurship is about spotting a problem and building a solution. '
          'Every successful business started with someone noticing an unmet need. '
          'Think about your own community — what problem do you see every day '
          'that nobody has solved yet?';
    }
    return 'That\'s a great question! Let me break it down step by step. '
        '[Gemma 3 1B model not loaded — this is a dev placeholder response.] '
        'Once the model file is installed, you\'ll get a real AI response here. '
        'What part of this topic interests you most?';
  }

  @override
  Future<void> dispose() async {
    _ready = false;
  }
}
