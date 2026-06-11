import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create')),
      body: const ScreenPlaceholder(
        icon: Icons.lightbulb,
        color: AppColors.createColor,
        title: 'Create Mode',
        description:
            'Build something meaningful. Start a business plan, a science project, a mobile app, '
            'or any real-world creation guided by your AI mentor.',
      ),
    );
  }
}
