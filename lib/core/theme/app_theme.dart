import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_border_radius.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => _buildLightTheme();
  static ThemeData _buildLightTheme() {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primarySurface,
      onPrimaryContainer: AppColors.primary,
      secondary: AppColors.textSecondary,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.grey100,
      onSecondaryContainer: AppColors.textPrimary,
      tertiary: AppColors.success,
      onTertiary: AppColors.white,
      tertiaryContainer: AppColors.successSurface,
      onTertiaryContainer: AppColors.success,
      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: AppColors.error,
      surface: AppColors.white,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.grey100,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.grey300,
      outlineVariant: AppColors.grey200,
      shadow: AppColors.shadow,
      scrim: AppColors.overlay,
      inverseSurface: AppColors.textPrimary,
      onInverseSurface: AppColors.white,
      inversePrimary: AppColors.primaryLight,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      // Scaffold
      scaffoldBackgroundColor: AppColors.background,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: AppColors.shadow,
        centerTitle: false,
        titleTextStyle: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
        actionsIconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey400,
        selectedLabelStyle: AppTextStyles.navLabel,
        unselectedLabelStyle: AppTextStyles.navLabel,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
      ),

      //  Navigation Bar (Material 3)
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.primarySurface,
        shadowColor: AppColors.shadow,
        elevation: 8,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.navLabel.copyWith(color: AppColors.primary);
          }
          return AppTextStyles.navLabel.copyWith(color: AppColors.grey400);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 24);
          }
          return const IconThemeData(color: AppColors.grey400, size: 24);
        }),
      ),

      //  Elevated Button (Primary)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey300;
            }
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryLight;
            }
            return AppColors.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.textDisabled;
            }
            return AppColors.white;
          }),
          textStyle: WidgetStateProperty.all(AppTextStyles.buttonLg),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.buttonRadius,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
          ),
          minimumSize: WidgetStateProperty.all(const Size.fromHeight(56)),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 0;
            return 0;
          }),
          overlayColor: WidgetStateProperty.all(
            AppColors.white.withValues(alpha: 0.1),
          ),
        ),
      ),

      //  Outlined Button (Secondary)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.textDisabled;
            }
            return AppColors.primary;
          }),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return const BorderSide(color: AppColors.grey300, width: 1.5);
            }
            return const BorderSide(color: AppColors.primary, width: 1.5);
          }),
          textStyle: WidgetStateProperty.all(AppTextStyles.buttonLg),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.buttonRadius,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
          ),
          minimumSize: WidgetStateProperty.all(const Size.fromHeight(56)),
          overlayColor: WidgetStateProperty.all(
            AppColors.primary.withValues(alpha: 0.05),
          ),
        ),
      ),

      //  Text Button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.primary),
          textStyle: WidgetStateProperty.all(AppTextStyles.buttonMd),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          overlayColor: WidgetStateProperty.all(
            AppColors.primary.withValues(alpha: 0.05),
          ),
        ),
      ),

      //  Input / Text Field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: AppTextStyles.inputHint.copyWith(color: AppColors.textHint),
        labelStyle: AppTextStyles.bodyMd.copyWith(
          color: AppColors.textSecondary,
        ),
        floatingLabelStyle: AppTextStyles.bodySm.copyWith(
          color: AppColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.grey300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.grey300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.inputRadius,
          borderSide: const BorderSide(color: AppColors.grey200, width: 1),
        ),
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) return AppColors.primary;
          return AppColors.grey400;
        }),
        suffixIconColor: AppColors.grey400,
        errorStyle: AppTextStyles.bodySm.copyWith(color: AppColors.error),
      ),

      //  Card
      cardTheme: CardThemeData(
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.cardRadius,
          side: BorderSide(color: AppColors.grey200, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      //  Chip
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.grey100,
        selectedColor: AppColors.primarySurface,
        disabledColor: AppColors.grey200,
        labelStyle: AppTextStyles.buttonSm.copyWith(
          color: AppColors.textSecondary,
        ),
        secondaryLabelStyle: AppTextStyles.buttonSm.copyWith(
          color: AppColors.primary,
        ),
        side: const BorderSide(color: AppColors.grey300, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.chipRadius,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        checkmarkColor: AppColors.primary,
      ),

      //  Bottom Sheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.bottomSheetRadius,
        ),
        dragHandleColor: AppColors.grey300,
        dragHandleSize: Size(40, 4),
        showDragHandle: true,
      ),

      //  Dialog
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.cardRadius),
        titleTextStyle: AppTextStyles.h5,
        contentTextStyle: AppTextStyles.bodyMd,
      ),

      //  Snack Bar / Toast
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.white),
        actionTextColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.chipRadius,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      //  Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: const BorderSide(color: AppColors.grey400, width: 1.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      ),

      //  Radio Button
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.grey400;
        }),
      ),

      //  Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.grey300;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      //  Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 1,
        space: 1,
      ),

      //  List Tile
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        titleTextStyle: AppTextStyles.bodyMd.copyWith(
          color: AppColors.textPrimary,
        ),
        subtitleTextStyle: AppTextStyles.bodySm.copyWith(
          color: AppColors.textSecondary,
        ),
        iconColor: AppColors.grey500,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.chipRadius,
        ),
      ),

      //  Icon
      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),

      //  Tab Bar
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey400,
        labelStyle: AppTextStyles.buttonMd,
        unselectedLabelStyle: AppTextStyles.bodyMdMedium,
        dividerColor: AppColors.grey200,
      ),

      //  Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.grey200,
        circularTrackColor: AppColors.grey200,
      ),

      //  Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 4,
        shape: CircleBorder(),
      ),

      //  Badge
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        textStyle: AppTextStyles.badge,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        smallSize: 8,
        largeSize: 16,
      ),

      //  Slider
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.grey200,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withValues(alpha: 0.1),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTextStyles.bodySm.copyWith(
          color: AppColors.white,
        ),
      ),

      //  Text Theme
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        headlineLarge: AppTextStyles.h1,
        headlineMedium: AppTextStyles.h2,
        headlineSmall: AppTextStyles.h3,
        titleLarge: AppTextStyles.h4,
        titleMedium: AppTextStyles.h5,
        titleSmall: AppTextStyles.h6,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        bodySmall: AppTextStyles.bodySm,
        labelLarge: AppTextStyles.buttonLg,
        labelMedium: AppTextStyles.buttonMd,
        labelSmall: AppTextStyles.buttonSm,
        displaySmall: AppTextStyles.caption,
      ),
    );
  }
}
