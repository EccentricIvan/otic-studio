import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/screen_placeholder.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificates')),
      body: const ScreenPlaceholder(
        icon: Icons.workspace_premium,
        color: AppColors.secondary,
        title: 'Your Certificates',
        description:
            'Earn verifiable skill certificates upon completing learning paths. '
            'Generated offline as printable PDFs and stored on your device.',
      ),
    );
  }
}
