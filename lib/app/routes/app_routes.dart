import 'package:get/get.dart';
import '../modules/home/view/home_view.dart';
import '../modules/splash/view/splash_view.dart';
// Import your screen files

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';


  static List<GetPage> get pages => [
    GetPage(
      name: splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
  ];
}
