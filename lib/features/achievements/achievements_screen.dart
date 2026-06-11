import 'package:flutter/material.dart';
import '../../shared/widgets/screen_placeholder.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: const ScreenPlaceholder(
        icon: Icons.emoji_events,
        color: Color(0xFFF59E0B),
        title: 'Your Achievements',
        description:
            'Points, badges, skill levels, streaks, and milestones earned on your learning journey. '
            'Every step forward is recognized.',
      ),
    );
  }
}
