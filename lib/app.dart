import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ai_core/model/model_manager.dart';
import 'ai_core/providers/ai_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/model_setup/model_not_installed_screen.dart';

class OticApp extends ConsumerWidget {
  const OticApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'OTIC Studio',
      theme: AppTheme.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Wraps the entire app: shows the model-not-installed gate if needed.
/// Used by the Learn screen internally — not blocking app launch,
/// so students can still browse the home screen and other areas.
class ModelGate extends ConsumerWidget {
  const ModelGate({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelInfo = ref.watch(modelInfoProvider);
    return modelInfo.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => child,
      data: (info) {
        if (info.status == ModelStatus.notInstalled) {
          return ModelNotInstalledScreen(info: info);
        }
        return child;
      },
    );
  }
}
