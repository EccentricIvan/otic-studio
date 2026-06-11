class Exercise {
  const Exercise({
    required this.topic,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  final String topic;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}
