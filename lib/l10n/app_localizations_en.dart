// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Stylish';

  @override
  String get tagline => 'Look Good, Feel Great';

  @override
  String get continueLabel => 'Continue';

  @override
  String get skipLabel => 'Skip';

  @override
  String get saveLabel => 'Save';

  @override
  String get cancelLabel => 'Cancel';

  @override
  String get deleteLabel => 'Delete';

  @override
  String get editLabel => 'Edit';

  @override
  String get closeLabel => 'Close';

  @override
  String get retryLabel => 'Retry';

  @override
  String get doneLabel => 'Done';

  @override
  String get confirmLabel => 'Confirm';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signOut => 'Sign Out';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameHint => 'Enter your full name';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get orContinueWith => 'Or continue with';

  @override
  String get loginWithGoogle => 'Continue with Google';

  @override
  String get loginWithFacebook => 'Continue with Facebook';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get createAccount => 'Create Account';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get home => 'Home';

  @override
  String get search => 'Search';

  @override
  String get cart => 'Cart';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get profile => 'Profile';

  @override
  String get orders => 'Orders';

  @override
  String get categories => 'Categories';

  @override
  String get notifications => 'Notifications';

  @override
  String get searchHint => 'Search products...';

  @override
  String get allCategories => 'All Categories';

  @override
  String get featured => 'Featured';

  @override
  String get newArrivals => 'New Arrivals';

  @override
  String get flashSale => 'Flash Sale';

  @override
  String get seeAll => 'See All';

  @override
  String get topRated => 'Top Rated';

  @override
  String get popular => 'Popular';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get addToWishlist => 'Add to Wishlist';

  @override
  String get removeFromWishlist => 'Remove from Wishlist';

  @override
  String get inStock => 'In Stock';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String lowStock(int count) {
    return 'Only $count left!';
  }

  @override
  String get productDetails => 'Product Details';

  @override
  String get reviews => 'Reviews';

  @override
  String reviewCount(int count) {
    return '$count reviews';
  }

  @override
  String get selectSize => 'Select Size';

  @override
  String get selectColor => 'Select Color';

  @override
  String get quantity => 'Quantity';

  @override
  String get description => 'Description';

  @override
  String get myCart => 'My Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get emptyCartSubtitle => 'Looks like you haven\'t added anything yet';

  @override
  String get shopNow => 'Shop Now';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get shipping => 'Shipping';

  @override
  String get discount => 'Discount';

  @override
  String get total => 'Total';

  @override
  String get proceedToCheckout => 'Proceed to Checkout';

  @override
  String get removeItem => 'Remove Item';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Checkout';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get creditCard => 'Credit / Debit Card';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get cvv => 'CVV';

  @override
  String get cardHolder => 'Card Holder Name';

  @override
  String get orderSuccess => 'Order Placed!';

  @override
  String get orderSuccessMessage => 'Your order has been placed successfully.';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get continueShopping => 'Continue Shopping';

  @override
  String get myOrders => 'My Orders';

  @override
  String orderNumber(String id) {
    return 'Order #$id';
  }

  @override
  String get orderStatus => 'Status';

  @override
  String get orderDate => 'Order Date';

  @override
  String get pending => 'Pending';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get shipped => 'Shipped';

  @override
  String get delivered => 'Delivered';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get myProfile => 'My Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get myAddresses => 'My Addresses';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get settings => 'Settings';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get rateApp => 'Rate the App';

  @override
  String get logout => 'Log Out';

  @override
  String get logoutConfirm => 'Are you sure you want to log out?';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get notifications_settings => 'Notifications';

  @override
  String get errorGeneral => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork => 'No internet connection. Check your network.';

  @override
  String get errorServer => 'Server error. Please try later.';

  @override
  String get errorUnauthorized => 'Session expired. Please sign in again.';

  @override
  String get errorNotFound => 'Page not found.';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get noResults => 'No results found';

  @override
  String get noResultsSubtitle => 'Try a different search term';
}
