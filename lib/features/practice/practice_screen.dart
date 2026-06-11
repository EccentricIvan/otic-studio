import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice')),
      body: const ScreenPlaceholder(
        icon: Icons.edit,
        color: AppColors.practiceColor,
        title: 'Practice Mode',
        description:
            'Reinforce what you have learned through exercises, challenges, and problem solving. '
            'OTIC adapts the difficulty to your level.',
      ),
    );
  }
}
