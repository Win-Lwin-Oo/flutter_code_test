import 'package:code_manage_test/app/models/movie_model.dart';
import 'package:code_manage_test/app/providers/movie_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final _movieProvider = MovieProvider();

  var isPopularLoading = true.obs;
  var isUpcomingLoading = true.obs;

  var popularMovieList = <Movie>[].obs;
  var upcomingMovieList = <Movie>[].obs;

  Future<void> getPopularMovieList() async {
    try {
      isPopularLoading(true);
      var movie = await _movieProvider.getPopularMovie();
      print('Popular movie controller =>\n ${movie}');
      popularMovieList.assignAll(movie);
    } catch (e) {
      print(e.toString());
    } finally {
      isPopularLoading(false);
    }
  }

  Future<void> getUpcomingMovieList() async {
    try {
      isUpcomingLoading(true);
      var movie = await _movieProvider.getUpcomingMovie();
      upcomingMovieList.assignAll(movie);
    } catch (e) {
      print(e.toString());
    } finally {
      isUpcomingLoading(false);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getPopularMovieList();
    getUpcomingMovieList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void tabNavItem(int index) {
    print('Index => $index');
    selectedIndex.value = index;
  }
}
