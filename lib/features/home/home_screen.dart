import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/learning_mode_card.dart';
import '../../shared/widgets/learning_path_card.dart';
import '../../shared/widgets/voice_ask_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.auto_stories, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('OTIC Studio'),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Sign in'),
          ),
          const SizedBox(width: 8),
          _GuestBadge(),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroSection(),
              const SizedBox(height: 48),
              SectionHeader(
                title: 'Start Learning',
                subtitle: 'Choose how you want to learn today',
              ),
              const SizedBox(height: 16),
              _LearningModesGrid(),
              const SizedBox(height: 48),
              SectionHeader(
                title: 'Recommended for You',
                subtitle: 'Popular paths to get started',
                actionLabel: 'See all',
                onAction: () => context.go('/learn'),
              ),
              const SizedBox(height: 16),
              ..._featuredPaths.map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: LearningPathCard(
                      title: p.title,
                      category: p.category,
                      description: p.description,
                      icon: p.icon,
                      color: p.color,
                      lessonCount: p.lessonCount,
                      onTap: () => context.go('/learn'),
                    ),
                  )),
              const SizedBox(height: 48),
              const Center(
                child: Text(
                  'OTIC Studio · Offline AI Learning OS · v1.0',
                  style: TextStyle(fontSize: 12, color: AppColors.textHint),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuestBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.teachColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Guest Demo',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.18)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi_off, size: 13, color: AppColors.primary),
              SizedBox(width: 6),
              Text(
                'Fully Offline · No Internet Required',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Learn anything,\nanywhere',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 14),
        Text(
          'Your offline AI mentor — always available, always patient,\nno internet needed.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 28),
        VoiceAskWidget(
          onSubmit: (query) {
            // TODO: navigate to learn with query pre-filled
            context.go('/learn');
          },
        ),
      ],
    );
  }
}

class _LearningModesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modes = [
      _Mode('Learn', 'Understand concepts with your AI mentor', Icons.menu_book, AppColors.learnColor, '/learn'),
      _Mode('Practice', 'Reinforce knowledge with exercises', Icons.edit, AppColors.practiceColor, '/practice'),
      _Mode('Create', 'Build real projects and solutions', Icons.lightbulb, AppColors.createColor, '/create'),
      _Mode('Teach', 'Achieve mastery by teaching OTIC', Icons.record_voice_over, AppColors.teachColor, '/learn'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 520 ? 4 : 2;
        return GridView.count(
          crossAxisCount: cols,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: cols == 4 ? 0.78 : 0.88,
          children: modes
              .map((m) => LearningModeCard(
                    title: m.title,
                    description: m.description,
                    icon: m.icon,
                    color: m.color,
                    onTap: () => context.go(m.path),
                  ))
              .toList(),
        );
      },
    );
  }
}

class _Mode {
  const _Mode(this.title, this.description, this.icon, this.color, this.path);

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String path;
}

class _PathData {
  const _PathData(this.title, this.category, this.description, this.icon, this.color, this.lessonCount);

  final String title;
  final String category;
  final String description;
  final IconData icon;
  final Color color;
  final int lessonCount;
}

const _featuredPaths = [
  _PathData(
    'Artificial Intelligence',
    'Technology',
    'Learn how AI works, from the basics to building your own models',
    Icons.psychology,
    AppColors.technologyColor,
    12,
  ),
  _PathData(
    'Entrepreneurship',
    'Business',
    'Start and grow your own business with practical step-by-step guidance',
    Icons.trending_up,
    AppColors.businessColor,
    10,
  ),
  _PathData(
    'Physics',
    'Academic',
    'Explore forces, energy, and the laws that govern our universe',
    Icons.science,
    AppColors.academicColor,
    15,
  ),
];
