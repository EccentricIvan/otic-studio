import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'New project',
          ),
        ],
      ),
      body: const ScreenPlaceholder(
        icon: Icons.folder_open,
        color: AppColors.primary,
        title: 'Your Projects',
        description:
            'All your in-progress and completed projects live here. '
            'Track your builds, continue where you left off, and share with collaborators.',
      ),
    );
  }
}
