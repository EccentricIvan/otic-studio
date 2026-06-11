import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ai_core/model/model_manager.dart';
import '../../ai_core/providers/ai_provider.dart';
import '../../core/theme/app_colors.dart';

class ModelNotInstalledScreen extends ConsumerWidget {
  const ModelNotInstalledScreen({super.key, required this.info});

  final ModelInfo info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.memory_outlined,
                    color: AppColors.primary, size: 40),
              ),
              const SizedBox(height: 24),
              Text(
                'AI Model Not Installed',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                info.status == ModelStatus.corrupted
                    ? 'A model file was found but appears corrupted or incomplete. '
                        'Please retransfer the file.'
                    : 'OTIC Studio needs the Gemma 3 1B model file to work. '
                        'No internet is needed — transfer the file via USB.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _InstructionsCard(ref: ref),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('Check again'),
                      onPressed: () => ref.invalidate(modelInfoProvider),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.science_outlined),
                      label: const Text('Try demo mode'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstructionsCard extends ConsumerWidget {
  const _InstructionsCard({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(modelManagerProvider);
    return FutureBuilder<String>(
      future: manager.installInstructions(),
      builder: (context, snap) {
        final text = snap.data ?? 'Loading instructions...';
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.usb, color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Text('How to install',
                      style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 18),
                    tooltip: 'Copy path',
                    onPressed: () => Clipboard.setData(ClipboardData(text: text)),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(text,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  )),
            ],
          ),
        );
      },
    );
  }
}
