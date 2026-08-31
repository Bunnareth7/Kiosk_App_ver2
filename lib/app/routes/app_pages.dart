import 'package:get/get.dart';

import '../modules/apply_coupon/bindings/apply_coupon_binding.dart';
import '../modules/apply_coupon/views/apply_coupon_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/cart_success/bindings/cart_success_binding.dart';
import '../modules/cart_success/views/cart_success_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
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
import '../modules/payment_success/bindings/payment_success_binding.dart';
import '../modules/payment_success/views/payment_success_view.dart';
import '../modules/remark/bindings/remark_binding.dart';
import '../modules/remark/views/remark_view.dart';
import '../modules/select_terminal/bindings/select_terminal_binding.dart';
import '../modules/select_terminal/views/select_terminal_view.dart';
import '../modules/spacial_deal_screen/bindings/spacial_deal_screen_binding.dart';
import '../modules/spacial_deal_screen/views/spacial_deal_screen_view.dart';
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
    GetPage(
      name: _Paths.CART_SUCCESS,
      page: () => const CartSuccessView(),
      binding: CartSuccessBinding(),
    ),
    GetPage(
      name: _Paths.SPACIAL_DEAL_SCREEN,
      page: () => const SpacialDealScreenView(),
      binding: SpacialDealScreenBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.REMARK,
      page: () => const RemarkView(),
      binding: RemarkBinding(),
    ),
    GetPage(
      name: _Paths.APPLY_COUPON,
      page: () => const ApplyCouponView(),
      binding: ApplyCouponBinding(),
    ),
  ];
}
