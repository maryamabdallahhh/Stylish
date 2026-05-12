abstract final class AppConstants {
  // ── App info ─────────────────────────────────────────────────────────────────
  static const String appName = 'Stylish';

  // ── SharedPreferences keys ───────────────────────────────────────────────────
  static const String kAccessToken = 'access_token';
  static const String kRefreshToken = 'refresh_token';
  static const String kUserId = 'user_id';
  static const String kIsLoggedIn = 'is_logged_in';
  static const String kOnboardingSeen = 'onboarding_seen';

  // ── Pagination ───────────────────────────────────────────────────────────────
  static const int pageSize = 20;
  static const int firstPage = 1;

  // ── Responsive design ────────────────────────────────────────────────────────
  /// Figma design frame size (iPhone 14 Pro).
  static const double designWidth = 375.0;
  static const double designHeight = 812.0;

  // ── Animation durations ──────────────────────────────────────────────────────
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 350);
  static const Duration slowAnimation = Duration(milliseconds: 500);

  // ── Image placeholders ────────────────────────────────────────────────────────
  static const String placeholderImage = 'assets/images/placeholder.png';
}
