import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../ai_core/providers/ai_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../db/providers/db_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  final _nameController = TextEditingController();
  int? _age;
  String? _grade;
  final String _language = 'en';
  final Set<String> _interests = {};
  String _learningStyle = 'unknown';
  bool _saving = false;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _next() {
    if (_page == 0) {
      // Welcome panel — just advance
    } else if (_page == 1 && _nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }
    if (_page < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _finish();
    }
  }

  void _back() {
    if (_page > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> _finish() async {
    if (_saving) return;
    setState(() => _saving = true);
    await ref
        .read(studentNotifierProvider.notifier)
        .createProfile(
          name: _nameController.text.trim(),
          age: _age,
          grade: _grade,
          language: _language,
          interests: _interests.toList(),
          learningStyle: _learningStyle,
        );
    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF1A1207),
                    AppColors.darkBackground,
                    const Color(0xFF0F1628),
                  ]
                : [
                    const Color(0xFFFFFBEB),
                    const Color(0xFFF8FAFC),
                    const Color(0xFFEFF6FF),
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _page == i ? 28 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _page == i
                            ? AppColors.primary
                            : AppColors.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) => setState(() => _page = i),
                  children: [
                    _WelcomePanel(),
                    _ProfilePanel(
                      nameController: _nameController,
                      age: _age,
                      grade: _grade,
                      onAge: (v) => setState(() => _age = v),
                      onGrade: (v) => setState(() => _grade = v),
                    ),
                    _InterestsPanel(
                      selected: _interests,
                      onToggle: (s) => setState(
                        () => _interests.contains(s)
                            ? _interests.remove(s)
                            : _interests.add(s),
                      ),
                      learningStyle: _learningStyle,
                      onStyleSelect: (s) =>
                          setState(() => _learningStyle = s),
                    ),
                    _LiveDemoPanel(interests: _interests),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.lg),
                child: Row(
                  children: [
                    if (_page > 0)
                      TextButton(
                        onPressed: _back,
                        child: const Text('Back'),
                      ),
                    const Spacer(),
                    SizedBox(
                      width: _page == 0 ? double.infinity : null,
                      child: FilledButton(
                        onPressed: _saving ? null : _next,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textPrimary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg, vertical: 14),
                        ),
                        child: _saving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.textPrimary,
                                ),
                              )
                            : Text(_page < 3 ? 'Continue' : 'Start learning'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Panel 1: Welcome ─────────────────────────────────────────────────────────

class _WelcomePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: AppSpacing.paddingLg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFFD97706)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              child: Image.asset(
                'assets/branding/otic_logo.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
                semanticLabel: 'Logo',
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Welcome to\nOtic Studio',
            style: theme.textTheme.displayLarge?.copyWith(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Your personal offline AI tutor.\nEverything stays on this device — no internet ever.',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            alignment: WrapAlignment.center,
            children: [
              _FeatureChip(Icons.wifi_off, 'Fully Offline'),
              _FeatureChip(Icons.psychology, 'AI Tutor'),
              _FeatureChip(Icons.shield_outlined, 'Private'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip(this.icon, this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: AppSpacing.borderRadiusSm,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Panel 2: Name + Age/Grade ────────────────────────────────────────────────

class _ProfilePanel extends StatelessWidget {
  const _ProfilePanel({
    required this.nameController,
    required this.age,
    required this.grade,
    required this.onAge,
    required this.onGrade,
  });

  final TextEditingController nameController;
  final int? age;
  final String? grade;
  final void Function(int?) onAge;
  final void Function(String?) onGrade;

  static const _grades = [
    'Primary 1–4',
    'Primary 5–7',
    'Secondary 1–3',
    'Secondary 4–6',
    'University',
    'Self-learner',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: AppSpacing.paddingLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What's your name?", style: theme.textTheme.headlineLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'This helps the AI tutor personalise your learning.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: nameController,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('How old are you?', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<int>(
            value: age,
            decoration: const InputDecoration(
              hintText: 'Select age (optional)',
            ),
            items: List.generate(
              60,
              (i) => DropdownMenuItem(
                value: i + 5,
                child: Text('${i + 5} years old'),
              ),
            ),
            onChanged: onAge,
          ),
          const SizedBox(height: AppSpacing.md),
          Text('What grade/level?', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: _grades
                .map(
                  (g) => ChoiceChip(
                    label: Text(g),
                    selected: grade == g,
                    onSelected: (_) => onGrade(grade == g ? null : g),
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    side: BorderSide(
                      color: grade == g ? AppColors.primary : AppColors.border,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ── Panel 3: Interests + Learning Style ──────────────────────────────────────

class _InterestsPanel extends StatelessWidget {
  const _InterestsPanel({
    required this.selected,
    required this.onToggle,
    required this.learningStyle,
    required this.onStyleSelect,
  });

  final Set<String> selected;
  final void Function(String) onToggle;
  final String learningStyle;
  final void Function(String) onStyleSelect;

  static const _topics = [
    ('Mathematics', Icons.calculate, Color(0xFF4F46E5)),
    ('Physics', Icons.science, Color(0xFF0EA5E9)),
    ('Biology', Icons.biotech, Color(0xFF10B981)),
    ('Chemistry', Icons.science_outlined, Color(0xFFF59E0B)),
    ('Programming', Icons.code, Color(0xFF6366F1)),
    ('AI & Data', Icons.psychology, Color(0xFF7C3AED)),
    ('Business', Icons.trending_up, Color(0xFFEA580C)),
    ('Agriculture', Icons.grass, Color(0xFF22C55E)),
    ('History', Icons.history_edu, Color(0xFF64748B)),
    ('Geography', Icons.public, Color(0xFF14B8A6)),
    ('English', Icons.menu_book, Color(0xFFEC4899)),
    ('Arts', Icons.palette, Color(0xFFEAB308)),
  ];

  static const _styles = [
    ('visual', Icons.visibility_outlined, 'Visual', 'Diagrams & examples'),
    ('reading', Icons.menu_book_outlined, 'Reading', 'Text & notes'),
    ('practice', Icons.fitness_center_outlined, 'Practice', 'Exercises & problems'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What topics interest you?',
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Pick as many as you like. Otic will personalise your paths.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: _topics.map((t) {
              final isSelected = selected.contains(t.$1);
              final color = t.$3;
              return GestureDetector(
                onTap: () => onToggle(t.$1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withValues(alpha: 0.14)
                        : color.withValues(alpha: 0.06),
                    borderRadius: AppSpacing.borderRadiusSm,
                    border: Border.all(
                      color: isSelected
                          ? color
                          : color.withValues(alpha: 0.18),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(t.$2, color: isSelected ? color : color.withValues(alpha: 0.72), size: 26),
                      const SizedBox(height: 6),
                      Text(
                        t.$1,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? color : theme.textTheme.bodyMedium?.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.md),
          Text('How do you learn best?', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: _styles.map((s) {
              final isSelected = learningStyle == s.$1;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onStyleSelect(s.$1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : theme.colorScheme.surface,
                      borderRadius: AppSpacing.borderRadiusSm,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : theme.dividerColor,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(s.$2, color: isSelected ? AppColors.primary : theme.hintColor, size: 24),
                        const SizedBox(height: 6),
                        Text(
                          s.$3,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected ? AppColors.primary : theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

// ── Panel 4: Live AI Demo ────────────────────────────────────────────────────

class _LiveDemoPanel extends ConsumerStatefulWidget {
  const _LiveDemoPanel({required this.interests});
  final Set<String> interests;

  @override
  ConsumerState<_LiveDemoPanel> createState() => _LiveDemoPanelState();
}

class _LiveDemoPanelState extends ConsumerState<_LiveDemoPanel> {
  bool _started = false;
  String _streamedText = '';
  bool _done = false;

  Future<void> _runDemo() async {
    if (_started) return;
    setState(() {
      _started = true;
      _streamedText = '';
      _done = false;
    });

    final topic = widget.interests.isNotEmpty
        ? widget.interests.first
        : 'Photosynthesis';

    try {
      final engine = await ref.read(engineLoadedProvider.future);
      await engine.generate(
        prompt: 'Create a short 3-sentence lesson about "$topic" for a student. '
            'Be clear, engaging, and encouraging.',
        maxTokens: 150,
        temperature: 0.7,
        onToken: (token) {
          if (mounted) setState(() => _streamedText += token);
        },
      );
    } catch (_) {
      if (mounted && _streamedText.isEmpty) {
        setState(() {
          _streamedText = 'Welcome to Otic Studio! I\'m your AI tutor running '
              'right here on your device. Ask me anything about $topic '
              'and I\'ll guide you through understanding, practice, and mastery.';
        });
      }
    }

    if (mounted) setState(() => _done = true);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _runDemo());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topic = widget.interests.isNotEmpty
        ? widget.interests.first
        : 'Photosynthesis';

    return SingleChildScrollView(
      padding: AppSpacing.paddingLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: AppSpacing.paddingSm,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.secondary.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppSpacing.borderRadiusLg,
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: AppSpacing.borderRadiusSm,
                  ),
                  child: const Icon(Icons.auto_awesome, color: AppColors.primary, size: 24),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your AI tutor is ready',
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        'Running on-device — no internet',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Watch it generate a lesson',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Here\'s a live preview for "$topic":',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 120),
            padding: AppSpacing.paddingSm,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: AppSpacing.borderRadiusLg,
              border: Border.all(color: theme.dividerColor),
            ),
            child: _streamedText.isEmpty
                ? _ShimmerLines()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _streamedText,
                        style: TextStyle(
                          color: theme.textTheme.bodyLarge?.color,
                          height: 1.6,
                          fontSize: 15,
                        ),
                      ),
                      if (!_done) ...[
                        const SizedBox(height: AppSpacing.xs),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
          if (_done) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: AppSpacing.paddingSm,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.08),
                borderRadius: AppSpacing.borderRadiusSm,
                border: Border.all(color: AppColors.success.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: AppColors.success, size: 20),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      'Your AI tutor is ready. Tap "Start learning" to begin!',
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ShimmerLines extends StatefulWidget {
  @override
  State<_ShimmerLines> createState() => _ShimmerLinesState();
}

class _ShimmerLinesState extends State<_ShimmerLines>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final opacity = 0.06 + (_controller.value * 0.08);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _line(1.0, opacity, theme),
            const SizedBox(height: 10),
            _line(0.92, opacity, theme),
            const SizedBox(height: 10),
            _line(0.78, opacity, theme),
            const SizedBox(height: 10),
            _line(0.6, opacity, theme),
          ],
        );
      },
    );
  }

  Widget _line(double widthFraction, double opacity, ThemeData theme) {
    return FractionallySizedBox(
      widthFactor: widthFraction,
      child: Container(
        height: 14,
        decoration: BoxDecoration(
          color: theme.textTheme.bodyMedium?.color?.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
