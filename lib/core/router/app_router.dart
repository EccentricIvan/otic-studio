import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/learn/learn_screen.dart';
import '../../features/practice/practice_screen.dart';
import '../../features/create/create_screen.dart';
import '../../features/projects/projects_screen.dart';
import '../../features/achievements/achievements_screen.dart';
import '../../features/certificates/certificates_screen.dart';
import '../../features/collaborate/collaborate_screen.dart';
import '../../features/teacher/teacher_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../shared/widgets/app_shell.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/learn', builder: (_, __) => const LearnScreen()),
        GoRoute(path: '/practice', builder: (_, __) => const PracticeScreen()),
        GoRoute(path: '/create', builder: (_, __) => const CreateScreen()),
        GoRoute(path: '/projects', builder: (_, __) => const ProjectsScreen()),
        GoRoute(path: '/achievements', builder: (_, __) => const AchievementsScreen()),
        GoRoute(path: '/certificates', builder: (_, __) => const CertificatesScreen()),
        GoRoute(path: '/collaborate', builder: (_, __) => const CollaborateScreen()),
        GoRoute(path: '/teacher', builder: (_, __) => const TeacherScreen()),
        GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
      ],
    ),
  ],
);
