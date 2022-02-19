import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../views/home_view.dart';
import '../bindings/movie_detail_binding.dart';
import '../views/movie_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
  ];
}
