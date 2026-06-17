import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../db/providers/db_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  // Form state
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
    if (_page == 0 && _nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name')));
      return;
    }
    if (_page < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
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
    if (mounted) context.go('/learn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress dots
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _page == i ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _page == i ? AppColors.primary : AppColors.border,
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
                  _NamePage(controller: _nameController),
                  _AgePage(
                    age: _age,
                    grade: _grade,
                    onAge: (v) => setState(() => _age = v),
                    onGrade: (v) => setState(() => _grade = v),
                  ),
                  _InterestsPage(
                    selected: _interests,
                    onToggle: (s) => setState(
                      () => _interests.contains(s)
                          ? _interests.remove(s)
                          : _interests.add(s),
                    ),
                  ),
                  _StylePage(
                    selected: _learningStyle,
                    onSelect: (s) => setState(() => _learningStyle = s),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saving ? null : _next,
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(_page < 3 ? 'Continue' : 'Start learning'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Page 1: Name ──────────────────────────────────────────────────────────────

class _NamePage extends StatelessWidget {
  const _NamePage({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.waving_hand,
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text('Welcome', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 8),
          const Text(
            'Your personal offline AI tutor. Everything stays on this device — no internet ever.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 40),
          Text(
            "What's your name?",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Page 2: Age + Grade ───────────────────────────────────────────────────────

class _AgePage extends StatelessWidget {
  const _AgePage({
    required this.age,
    required this.grade,
    required this.onAge,
    required this.onGrade,
  });
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('About you', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 8),
          const Text(
            'This helps the AI tutor explain things at the right level. You can skip.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 32),
          Text(
            'How old are you?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int>(
            initialValue: age,
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
          const SizedBox(height: 24),
          Text(
            'What grade/level are you in?',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _grades
                .map(
                  (g) => ChoiceChip(
                    label: Text(g),
                    selected: grade == g,
                    onSelected: (_) => onGrade(grade == g ? null : g),
                    selectedColor: AppColors.primary.withValues(alpha: 0.12),
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

// ── Page 3: Interests ─────────────────────────────────────────────────────────

class _InterestsPage extends StatelessWidget {
  const _InterestsPage({required this.selected, required this.onToggle});
  final Set<String> selected;
  final void Function(String) onToggle;

  static const _topics = [
    ('Mathematics', Icons.calculate),
    ('Physics', Icons.science),
    ('Biology', Icons.biotech),
    ('Chemistry', Icons.science_outlined),
    ('Programming', Icons.code),
    ('AI & Data', Icons.psychology),
    ('Business', Icons.trending_up),
    ('Agriculture', Icons.grass),
    ('History', Icons.history_edu),
    ('Geography', Icons.public),
    ('English', Icons.menu_book),
    ('Arts', Icons.palette),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What topics interest you?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pick as many as you like. Your paths will be personalised.',
                  style: TextStyle(color: AppColors.textSecondary, height: 1.6),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
              children: _topics.map((t) {
                final isSelected = selected.contains(t.$1);
                return GestureDetector(
                  onTap: () => onToggle(t.$1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.border,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          t.$2,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          size: 26,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          t.$1,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Page 4: Learning style ────────────────────────────────────────────────────

class _StylePage extends StatelessWidget {
  const _StylePage({required this.selected, required this.onSelect});
  final String selected;
  final void Function(String) onSelect;

  static const _styles = [
    (
      'visual',
      Icons.visibility_outlined,
      'Visual',
      'I learn best from diagrams, examples, and seeing things',
    ),
    (
      'reading',
      Icons.menu_book_outlined,
      'Reading',
      'I learn best by reading explanations and taking notes',
    ),
    (
      'practice',
      Icons.fitness_center_outlined,
      'Practice',
      'I learn best by doing exercises and solving problems',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'How do you learn best?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'The AI tutor adapts its teaching style to suit you.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 32),
          ..._styles.map((s) {
            final isSelected = selected == s.$1;
            return GestureDetector(
              onTap: () => onSelect(s.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.08)
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      s.$2,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.$3,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            s.$4,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
