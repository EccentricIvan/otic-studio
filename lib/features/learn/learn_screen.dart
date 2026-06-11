import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/voice_ask_widget.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VoiceAskWidget(
              onSubmit: (query) {
                // TODO: send query to local Gemma AI pipeline
              },
            ),
            const SizedBox(height: 32),
            Text('Explore Topics', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _TopicsGrid(),
          ],
        ),
      ),
    );
  }
}

class _TopicsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const topics = [
      _Topic('Mathematics', Icons.calculate, AppColors.learnColor),
      _Topic('Physics', Icons.science, AppColors.academicColor),
      _Topic('Programming', Icons.code, AppColors.technologyColor),
      _Topic('Entrepreneurship', Icons.trending_up, AppColors.businessColor),
      _Topic('Biology', Icons.biotech, AppColors.teachColor),
      _Topic('History', Icons.history_edu, AppColors.lifeSkillsColor),
      _Topic('Agriculture', Icons.grass, AppColors.agricultureColor),
      _Topic('AI & Data', Icons.psychology, AppColors.secondary),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.4,
      children: topics
          .map((t) => Card(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: t.color.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(t.icon, color: t.color, size: 18),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            t.label,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _Topic {
  const _Topic(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}
