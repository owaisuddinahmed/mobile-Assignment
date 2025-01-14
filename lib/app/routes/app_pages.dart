import 'package:get/get.dart';
import 'package:mobile_assignment/app/modules/trending/bindings/trending_binding.dart';
import 'package:mobile_assignment/app/modules/trending/view/trending_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.trendingView;

  static final routes = [
    GetPage(
      name: _Paths.trendingView,
      page: () =>  TrendingView(),
      binding: TrendingBinding(),
    ),
  ];
}
