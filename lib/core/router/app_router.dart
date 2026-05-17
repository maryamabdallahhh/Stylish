import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/product/presentation/cubit/product_cubit.dart';
import '../../features/product/presentation/pages/product_detail_page.dart';
import '../../features/product/presentation/pages/product_list_page.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../di/injection_container.dart';
import 'route_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  debugLogDiagnostics: true,
  routes: [
    // ── Splash ────────────────────────────────────────────────────────────────
    GoRoute(
      path: RouteNames.splash,
      name: 'splash',
      builder: (_, __) => BlocProvider(
        create: (_) => sl<SplashCubit>()..init(),
        child: const SplashPage(),
      ),
    ),

    // ── Onboarding ────────────────────────────────────────────────────────────
    GoRoute(
      path: RouteNames.onboarding,
      name: 'onboarding',
      builder: (_, __) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnboardingPage(),
      ),
    ),

    // ── Auth ──────────────────────────────────────────────────────────────────
    GoRoute(
      path: RouteNames.login,
      name: 'login',
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.register,
      name: 'register',
      builder: (_, __) => const RegisterPage(),
    ),

    // ── Main shell with bottom nav ─────────────────────────────────────────────
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => _AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.home,
              name: 'home',
              builder: (_, __) => BlocProvider(
                create: (_) => sl<HomeCubit>()..loadHome(),
                child: const HomePage(),
              ),
              routes: [
                GoRoute(
                  path: 'products',
                  name: 'product-list',
                  builder: (_, __) => BlocProvider(
                    create: (_) => sl<ProductCubit>()..loadProducts(),
                    child: const ProductListPage(),
                  ),
                ),
                GoRoute(
                  path: 'products/:id',
                  name: 'product-detail',
                  builder: (_, state) => BlocProvider(
                    create: (_) => sl<ProductCubit>(),
                    child: ProductDetailPage(productId: state.pathParameters['id']!),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.cart,
              name: 'cart',
              builder: (_, __) => BlocProvider(
                create: (_) => sl<CartCubit>()..loadCart(),
                child: const CartPage(),
              ),
              routes: [
                GoRoute(
                  path: '/checkout',
                  name: 'checkout',
                  builder: (_, __) => const CheckoutPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.profile,
              name: 'profile',
              builder: (_, __) => BlocProvider(
                create: (_) => sl<ProfileCubit>()..loadProfile(),
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (_, state) => Scaffold(
    body: Center(child: Text('Page not found: ${state.error}')),
  ),
);

class _AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const _AppShell({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
