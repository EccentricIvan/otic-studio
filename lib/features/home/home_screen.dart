import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../db/providers/db_provider.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/learning_mode_card.dart';
import '../../shared/widgets/learning_path_card.dart';
import '../../shared/widgets/voice_ask_widget.dart';
import '../learn/path/path_models.dart';
import '../learn/path/path_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroSection(),
              const SizedBox(height: 48),
              const SectionHeader(
                title: 'Start Learning',
                subtitle: 'Choose how you want to learn today',
              ),
              const SizedBox(height: 16),
              _LearningModesGrid(),
              const SizedBox(height: 48),
              const _RecommendedSection(),
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
            context.go(
                '/learn?topic=${Uri.encodeComponent(query)}');
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
      const _Mode('Learn', 'Understand concepts with your AI mentor', Icons.menu_book, AppColors.learnColor, '/learn'),
      const _Mode('Practice', 'Reinforce knowledge with exercises', Icons.edit, AppColors.practiceColor, '/practice'),
      const _Mode('Create', 'Build real projects and solutions', Icons.lightbulb, AppColors.createColor, '/create'),
      const _Mode('Teach', 'Achieve mastery by teaching OTIC', Icons.record_voice_over, AppColors.teachColor, '/teach'),
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

// ── Recommended / active paths section ───────────────────────────────────────

class _RecommendedSection extends ConsumerWidget {
  const _RecommendedSection();

  static const _suggestedTopics = [
    ('Artificial Intelligence', Icons.psychology, AppColors.technologyColor),
    ('Entrepreneurship', Icons.trending_up, AppColors.businessColor),
    ('Physics', Icons.science, AppColors.academicColor),
    ('Mathematics', Icons.calculate, AppColors.learnColor),
    ('Biology', Icons.biotech, AppColors.agricultureColor),
    ('English Writing', Icons.edit_note, AppColors.lifeSkillsColor),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentAsync = ref.watch(activeStudentProvider);
    final pathsAsync = ref.watch(studentPathsProvider);

    return pathsAsync.when(
      data: (rows) {
        final hasPaths = rows.isNotEmpty;
        final paths = rows.map(parsedFromRow).toList();

        // Personalise suggested topics using student interests
        final student = studentAsync.valueOrNull;
        final interests = student != null
            ? (student.interestsJson.isNotEmpty &&
                    student.interestsJson != '[]'
                ? (student.interestsJson
                    .replaceAll('[', '')
                    .replaceAll(']', '')
                    .replaceAll('"', '')
                    .split(',')
                    .map((s) => s.trim())
                    .where((s) => s.isNotEmpty)
                    .toList())
                : <String>[])
            : <String>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasPaths) ...[
              SectionHeader(
                title: 'Continue Learning',
                subtitle: 'Pick up where you left off',
                actionLabel: 'View all',
                onAction: () => context.go('/learn'),
              ),
              const SizedBox(height: 16),
              ...paths.take(3).map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ActivePathCard(
                      path: p,
                      onTap: () => context.push(
                          '/path/${Uri.encodeComponent(p.topic)}'),
                    ),
                  )),
              const SizedBox(height: 32),
            ],
            SectionHeader(
              title: hasPaths ? 'Explore New Topics' : 'Start Your First Path',
              subtitle: interests.isNotEmpty
                  ? 'Based on your interests'
                  : 'Popular paths to get started',
              actionLabel: 'Browse',
              onAction: () => context.go('/learn'),
            ),
            const SizedBox(height: 16),
            ..._suggestedTopics
                .where((t) =>
                    !rows.any((r) => r.topic == t.$1))
                .take(3)
                .map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: LearningPathCard(
                        title: t.$1,
                        category: _category(t.$1),
                        description: _desc(t.$1),
                        icon: t.$2,
                        color: t.$3,
                        lessonCount: 12,
                        onTap: () => context.push(
                            '/path/${Uri.encodeComponent(t.$1)}'),
                      ),
                    )),
          ],
        );
      },
      loading: () => const SizedBox(
        height: 120,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  String _category(String topic) {
    const map = {
      'Artificial Intelligence': 'Technology',
      'Entrepreneurship': 'Business',
      'Physics': 'Academic',
      'Mathematics': 'Academic',
      'Biology': 'Academic',
      'English Writing': 'Life Skills',
    };
    return map[topic] ?? 'General';
  }

  String _desc(String topic) {
    const map = {
      'Artificial Intelligence':
          'Learn how AI works, from basics to building your own models',
      'Entrepreneurship':
          'Start and grow your business with step-by-step guidance',
      'Physics': 'Explore forces, energy, and laws that govern our universe',
      'Mathematics':
          'Build solid foundations — arithmetic through calculus',
      'Biology':
          'Discover the science of life, cells, and ecosystems',
      'English Writing':
          'Write clearly and confidently for any situation',
    };
    return map[topic] ?? 'Build a complete understanding of $topic';
  }
}

class _ActivePathCard extends StatelessWidget {
  const _ActivePathCard({required this.path, required this.onTap});
  final ParsedPath path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    path.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.learnColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${(path.progressFraction * 100).round()}%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.learnColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: path.progressFraction,
                minHeight: 6,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.learnColor),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${path.completedLessons} of ${path.totalLessons} lessons complete',
              style: const TextStyle(
                  fontSize: 12, color: AppColors.textHint),
            ),
          ],
        ),
      ),
    );
  }
}
