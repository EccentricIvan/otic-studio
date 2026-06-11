import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teacher Portal')),
      body: const ScreenPlaceholder(
        icon: Icons.school,
        color: AppColors.teachColor,
        title: 'Teacher Portal',
        description:
            'Monitor student performance, view strengths and weak areas, create learning groups, '
            'generate quizzes and assessments, and guide learners effectively.',
      ),
    );
  }
}
