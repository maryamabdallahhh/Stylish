import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

// ─── BuildContext extensions ──────────────────────────────────────────────────

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get padding => mediaQuery.padding;
  bool get isKeyboardOpen => viewInsets.bottom > 0;

  void hideKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.error : AppColors.textPrimary,
      ),
    );
  }
}

// ─── String extensions ────────────────────────────────────────────────────────

extension StringX on String {
  bool get isValidEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  bool get isValidPassword => length >= 8;
  bool get isValidPhone => RegExp(r'^\+?[\d\s\-]{10,}$').hasMatch(this);

  String get capitalised => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String truncate(int maxLength, {String ellipsis = '...'}) =>
      length <= maxLength ? this : '${substring(0, maxLength)}$ellipsis';
}

// ─── Nullable extensions ──────────────────────────────────────────────────────

extension NullableStringX on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

// ─── num extensions ──────────────────────────────────────────────────────────
// Note: .w .h .sp .r are already provided on [num] by flutter_screenutil.
// We only add SizedBox convenience helpers here.

extension NumX on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble().h);
  SizedBox get horizontalSpace => SizedBox(width: toDouble().w);
}

// ─── double extensions ────────────────────────────────────────────────────────

extension DoubleX on double {
  String toCurrency({String symbol = '\$'}) => '$symbol${toStringAsFixed(2)}';
}

// ─── TextStyle extensions ─────────────────────────────────────────────────────

extension TextStyleX on TextStyle {
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get secondary => copyWith(color: AppColors.textSecondary);
  TextStyle get hint => copyWith(color: AppColors.textHint);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get error => copyWith(color: AppColors.error);
  TextStyle get success => copyWith(color: AppColors.success);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle withOpacityValue(double opacity) => copyWith(color: color?.withValues(alpha: opacity));
}

// ─── Widget extensions ────────────────────────────────────────────────────────

extension WidgetX on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);
  Widget paddingHorizontal(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);
  Widget paddingVertical(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);
  Widget paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), child: this);
  Widget get center => Center(child: this);
  Widget get expanded => Expanded(child: this);
  Widget get sliver => SliverToBoxAdapter(child: this);
}

// ─── DateTime extensions ──────────────────────────────────────────────────────

extension DateTimeX on DateTime {
  String get formatted => '${day.toString().padLeft(2, '0')}/'
      '${month.toString().padLeft(2, '0')}/$year';
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
