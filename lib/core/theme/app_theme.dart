import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

class AppTheme {
  AppTheme._();

  static const _font = 'PlusJakartaSans';

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final bg = isDark ? AppColors.darkBackground : AppColors.background;
    final surface = isDark ? AppColors.darkSurface : AppColors.surface;
    final surfaceVariant = isDark ? AppColors.darkSurfaceVariant : AppColors.surfaceVariant;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.border;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
    final textHint = isDark ? AppColors.darkTextHint : AppColors.textHint;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      surface: surface,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: const Color(0xFFEF4444),
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: bg,
      brightness: brightness,
    );

    final textTheme = base.textTheme.apply(fontFamily: _font);

    return base.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge: TextStyle(
          fontFamily: _font,
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          height: 1.1,
          letterSpacing: -1,
        ),
        headlineLarge: TextStyle(
          fontFamily: _font,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: _font,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontFamily: _font,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: _font,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: _font,
          fontSize: 16,
          color: textSecondary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: _font,
          fontSize: 14,
          color: textSecondary,
          height: 1.5,
        ),
        labelLarge: const TextStyle(
          fontFamily: _font,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: borderColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: _font,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
          side: BorderSide(color: borderColor),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSm,
          ),
          textStyle: const TextStyle(
            fontFamily: _font,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSm,
          ),
          textStyle: const TextStyle(
            fontFamily: _font,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSm,
          ),
          textStyle: const TextStyle(
            fontFamily: _font,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSm,
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSm,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSm,
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: TextStyle(
          fontFamily: _font,
          color: textHint,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shadowColor: borderColor,
        indicatorColor: AppColors.primary.withValues(alpha: 0.15),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 22);
          }
          return IconThemeData(color: textSecondary, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontFamily: _font,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            );
          }
          return TextStyle(
            fontFamily: _font,
            fontSize: 11,
            color: textSecondary,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: surface,
        selectedIconTheme: const IconThemeData(color: AppColors.primary),
        unselectedIconTheme: IconThemeData(color: textSecondary),
        indicatorColor: AppColors.primary.withValues(alpha: 0.15),
        labelType: NavigationRailLabelType.selected,
        selectedLabelTextStyle: const TextStyle(
          fontFamily: _font,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: _font,
          fontSize: 12,
          color: textSecondary,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: borderColor,
        thickness: 1,
        space: 1,
      ),
      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        side: BorderSide(color: borderColor),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSm,
        ),
      ),
    );
  }
}
