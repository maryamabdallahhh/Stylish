abstract final class ApiConstants {
  // ── Base ────────────────────────────────────────────────────────────────────
  static const String baseUrl = 'https://api.stylish.com/v1';

  // ── Auth ────────────────────────────────────────────────────────────────────
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // ── User / Profile ──────────────────────────────────────────────────────────
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile';

  // ── Products ────────────────────────────────────────────────────────────────
  static const String products = '/products';
  static const String productDetail = '/products/{id}';
  static const String categories = '/categories';
  static const String search = '/products/search';
  static const String featured = '/products/featured';
  static const String newArrivals = '/products/new-arrivals';
  static const String flashSale = '/products/flash-sale';

  // ── Cart ────────────────────────────────────────────────────────────────────
  static const String cart = '/cart';
  static const String addToCart = '/cart/items';
  static const String removeFromCart = '/cart/items/{id}';
  static const String updateCartItem = '/cart/items/{id}';

  // ── Wishlist ────────────────────────────────────────────────────────────────
  static const String wishlist = '/wishlist';
  static const String addToWishlist = '/wishlist/items';
  static const String removeFromWishlist = '/wishlist/items/{id}';

  // ── Orders ──────────────────────────────────────────────────────────────────
  static const String orders = '/orders';
  static const String orderDetail = '/orders/{id}';
  static const String placeOrder = '/orders';

  // ── Checkout ────────────────────────────────────────────────────────────────
  static const String addresses = '/addresses';
  static const String paymentMethods = '/payment-methods';

  // ── Timeouts ────────────────────────────────────────────────────────────────
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
}
