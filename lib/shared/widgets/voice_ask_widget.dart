import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class VoiceAskWidget extends StatefulWidget {
  const VoiceAskWidget({super.key, this.onSubmit});

  final ValueChanged<String>? onSubmit;

  @override
  State<VoiceAskWidget> createState() => _VoiceAskWidgetState();
}

class _VoiceAskWidgetState extends State<VoiceAskWidget> {
  final _controller = TextEditingController();

  static const _prompts = [
    'Explain photosynthesis',
    'Teach me Python',
    'How does gravity work?',
    'What is entrepreneurship?',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: AppSpacing.borderRadiusSm,
            border: Border.all(color: theme.dividerColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              Icon(Icons.search, color: theme.hintColor, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Ask Otic anything...',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    fillColor: Colors.transparent,
                    filled: false,
                  ),
                  onSubmitted: (_) => _submit(),
                ),
              ),
              Padding(
                padding: AppSpacing.paddingXs,
                child: Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Voice input — offline STT coming soon'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.mic, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textPrimary,
                        minimumSize: const Size(40, 40),
                      ),
                      tooltip: 'Voice input',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: _prompts
              .map(
                (p) => ActionChip(
                  label: Text(
                    p,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  onPressed: () => setState(() => _controller.text = p),
                  backgroundColor: theme.colorScheme.surface,
                  side: BorderSide(color: theme.dividerColor),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
