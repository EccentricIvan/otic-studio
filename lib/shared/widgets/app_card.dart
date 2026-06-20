import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.color,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Container(
      padding: padding ?? AppSpacing.paddingSm,
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.surface,
        borderRadius: AppSpacing.borderRadiusLg,
        border: Border.all(color: theme.dividerColor),
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AppSpacing.borderRadiusLg,
        child: content,
      );
    }
    return content;
  }
}
