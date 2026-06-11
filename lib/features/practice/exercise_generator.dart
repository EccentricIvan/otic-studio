import 'dart:convert';
import '../../ai_core/inference/inference_engine.dart';
import 'exercise_models.dart';

class ExerciseGenerator {
  ExerciseGenerator({required InferenceEngine engine}) : _engine = engine;

  final InferenceEngine _engine;

  Future<Exercise> generate({
    required String topic,
    int masteryLevel = 0,
  }) async {
    final difficulty = masteryLevel < 20
        ? 'beginner'
        : masteryLevel < 50
            ? 'intermediate'
            : 'advanced';

    final prompt = '''You are an expert teacher. Create one multiple-choice quiz question as valid JSON.

Topic: $topic
Difficulty: $difficulty

Respond ONLY with this JSON (no explanation, no markdown):
{
  "question": "The question text here?",
  "options": ["Option A", "Option B", "Option C", "Option D"],
  "correctIndex": 0,
  "explanation": "One sentence explaining why this answer is correct."
}

Rules:
- correctIndex is 0-3 (which option is correct)
- Keep the question clear and relevant to $topic
- Make wrong options plausible but clearly distinguishable
- Explanation must be educational and concise
- No markdown, ONLY raw JSON''';

    try {
      final raw = await _engine.generate(
        prompt: prompt,
        maxTokens: 350,
        temperature: 0.5,
      );
      return _parse(topic, raw);
    } catch (_) {
      return _fallback(topic);
    }
  }

  Exercise _parse(String topic, String raw) {
    final start = raw.indexOf('{');
    final end = raw.lastIndexOf('}');
    if (start == -1 || end == -1) throw const FormatException('No JSON');

    final data = jsonDecode(raw.substring(start, end + 1)) as Map<String, dynamic>;
    final options = (data['options'] as List<dynamic>? ?? [])
        .map((o) => o.toString())
        .toList();

    if (options.length != 4) throw const FormatException('Need 4 options');

    return Exercise(
      topic: topic,
      question: data['question'] as String? ?? 'Question about $topic',
      options: options,
      correctIndex: (data['correctIndex'] as num? ?? 0).toInt().clamp(0, 3),
      explanation: data['explanation'] as String? ?? 'This is the correct answer.',
    );
  }

  Exercise _fallback(String topic) => Exercise(
        topic: topic,
        question: 'Which of the following best describes $topic?',
        options: [
          'A structured system of knowledge and principles',
          'A random collection of unrelated facts',
          'A process only used by experts',
          'Something that cannot be learned from books',
        ],
        correctIndex: 0,
        explanation:
            '$topic is a structured field with principles that can be studied and applied systematically.',
      );
}
