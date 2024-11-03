




import 'package:get/get.dart';

import '../../features/auth/logic/auth_bindings.dart';
import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/cart/logic/cart_bindings.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/home/logic/home_bindings.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/product_detail/logic/details_bindings.dart';
import '../../features/product_detail/presentation/screens/details_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/wishlist/logic/wishlist_bindings.dart';
import '../../features/wishlist/presentation/screens/wishlist_screen.dart';
import '../../splash/splash_screen.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String detailsRoute = '/details';
  static const String wishlistRoute = '/wishlist';
  static const String profileRoute = '/profile';
  static const String checkoutRoute = '/cart';

  static final List<GetPage> pages =[
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: authRoute, page: () => const AuthScreen(),binding: AuthBindgins()),
    GetPage(name: homeRoute, page: () => const HomeScreen(),bindings: [WishlistBindings(),HomeBindings()]),
    GetPage(name: wishlistRoute, page: () => const WishListScreen(),binding: WishlistBindings()),
    GetPage(name: profileRoute, page: () => const ProfileScreen()),
    GetPage(name: detailsRoute, page: () => const DetailsScreen(),bindings: [CartBindings(),DetailsBindings()]),
    GetPage(name: checkoutRoute, page: () => const CartScreen(),binding: CartBindings()),
  ];

}