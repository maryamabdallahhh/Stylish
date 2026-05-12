abstract final class RouteNames {
  // ── Splash / Onboarding ──────────────────────────────────────────────────────
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  // ── Auth ─────────────────────────────────────────────────────────────────────
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // ── Main shell ───────────────────────────────────────────────────────────────
  static const String shell = '/app';
  static const String home = '/app/home';
  static const String search = '/app/search';
  static const String cart = '/app/cart';
  static const String profile = '/app/profile';

  // ── Products ─────────────────────────────────────────────────────────────────
  static const String productList = '/app/products';
  static const String productDetail = '/app/products/:id';
  static const String category = '/app/category/:id';

  // ── Checkout ─────────────────────────────────────────────────────────────────
  static const String checkout = '/checkout';
  static const String orderSuccess = '/checkout/success';

  // ── Profile sub-routes ───────────────────────────────────────────────────────
  static const String orders = '/app/orders';
  static const String orderDetail = '/app/orders/:id';
  static const String wishlist = '/app/wishlist';
  static const String editProfile = '/app/edit-profile';
  static const String addresses = '/app/addresses';
}
