part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MOVIE_DETAIL = _Paths.MOVIE_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MOVIE_DETAIL = '/movie-detail';
}
