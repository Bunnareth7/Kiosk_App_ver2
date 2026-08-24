import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/language_page/bindings/language_page_binding.dart';
import '../modules/language_page/views/language_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/ordering_page/bindings/ordering_page_binding.dart';
import '../modules/ordering_page/views/ordering_page_view.dart';
import '../modules/select_terminal/bindings/select_terminal_binding.dart';
import '../modules/select_terminal/views/select_terminal_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_TERMINAL,
      page: () => const SelectionTerminalView(),
      binding: SelectTerminalBinding(),
    ),
    GetPage(name: _Paths.SPLASH, page: () => const SplashView()),
    GetPage(name: _Paths.START_ORDER, page: () => const OrderingView()),
    GetPage(name: _Paths.LANGUAGE, page: () => const LanguageView()),
    GetPage(
      name: _Paths.ORDERING_PAGE,
      page: () => const OrderingView(),
      binding: OrderingPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_PAGE,
      page: () => const LanguageView(),
      binding: LanguagePageBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
  ];
}
