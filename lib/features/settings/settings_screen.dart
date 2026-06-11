import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _SettingsSection(
            title: 'AI Model',
            children: [
              ListTile(
                leading: const Icon(Icons.memory, color: AppColors.primary),
                title: const Text('Active Model'),
                subtitle: const Text('Gemma 3 1B — not installed'),
                trailing: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Install'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.storage, color: AppColors.textSecondary),
                title: const Text('Model Storage'),
                subtitle: const Text('0 MB used'),
                onTap: () {},
              ),
            ],
          ),
          _SettingsSection(
            title: 'Profile',
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline, color: AppColors.textSecondary),
                title: const Text('Student Profile'),
                subtitle: const Text('Set your age, interests, and learning style'),
                onTap: () {},
                trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
              ),
              ListTile(
                leading: const Icon(Icons.translate, color: AppColors.textSecondary),
                title: const Text('Language'),
                subtitle: const Text('English'),
                onTap: () {},
                trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
              ),
            ],
          ),
          _SettingsSection(
            title: 'Voice',
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.mic_outlined, color: AppColors.textSecondary),
                title: const Text('Voice Input'),
                subtitle: const Text('Offline speech recognition (Vosk)'),
                value: false,
                onChanged: (_) {},
              ),
              SwitchListTile(
                secondary: const Icon(Icons.volume_up_outlined, color: AppColors.textSecondary),
                title: const Text('Text-to-Speech'),
                subtitle: const Text('Offline TTS (Piper)'),
                value: false,
                onChanged: (_) {},
              ),
            ],
          ),
          _SettingsSection(
            title: 'Updates',
            children: [
              ListTile(
                leading: const Icon(Icons.system_update_outlined, color: AppColors.textSecondary),
                title: const Text('Install Update'),
                subtitle: const Text('Load from USB drive or local server'),
                onTap: () {},
                trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
              ),
            ],
          ),
          _SettingsSection(
            title: 'About',
            children: [
              const ListTile(
                leading: Icon(Icons.info_outline, color: AppColors.textSecondary),
                title: Text('Version'),
                subtitle: Text('OTIC Studio v1.0.0'),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text('Clear All Data', style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...children,
        const Divider(height: 1),
      ],
    );
  }
}
