import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class CollaborateScreen extends StatelessWidget {
  const CollaborateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collaborate')),
      body: const ScreenPlaceholder(
        icon: Icons.groups,
        color: AppColors.practiceColor,
        title: 'Collaborate',
        description:
            'Join learning groups, work on projects with peers, challenge friends, '
            'and teach each other — all over your local school network, no internet needed.',
      ),
    );
  }
}
