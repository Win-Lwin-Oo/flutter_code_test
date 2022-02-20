import 'package:code_manage_test/app/models/local_movie_model.dart';
import 'package:code_manage_test/app/models/movie_model.dart';
import 'package:code_manage_test/app/providers/movie_provider.dart';
import 'package:code_manage_test/utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';

class HomeController extends GetxController {
  final _movieProvider = MovieProvider();

  var isPopularLoading = false.obs;
  var isUpcomingLoading = false.obs;

  var popularMovieList = <Movie>[].obs;
  var upcomingMovieList = <Movie>[].obs;

  var localPopularMovieList = <LocalMovie>[].obs;
  var localUpcommingMovieList = <LocalMovie>[].obs;

  var database = DatabaseHelper();
  var isFavourite = false.obs;

  Future<void> getPopularMovieList() async {
    try {
      isPopularLoading(true);
      var movie = await _movieProvider.getPopularMovie();
      // print('Popular movie controller =>\n ${movie}');
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

  Future<int> getDataCount() async {
    return await database.getDataCount(database.POPULAR_TABLE);
  }

  Future<void> getLocalMovie() async {
    try {
      if (!isPopularLoading.value) isPopularLoading(true);
      if (!isUpcomingLoading.value) isUpcomingLoading(true);
      var popular = await database.getData(database.POPULAR_TABLE);
      localPopularMovieList.assignAll(popular);

      var upcomming = await database.getData(database.UPCOMMING_TABLE);
      localUpcommingMovieList.assignAll(upcomming);
    } catch (e) {
      print(e);
    } finally {
      isPopularLoading(false);
      isUpcomingLoading(false);
    }
  }

  Future<void> addData() async {
    for (var data in popularMovieList) {
      LocalMovie localMovie = LocalMovie(
          id: data.id,
          title: data.title,
          overview: data.overview,
          posterPath: data.posterPath,
          favourite: 0);
      await database.addData(localMovie, database.POPULAR_TABLE);
    }

    for (var data in upcomingMovieList) {
      LocalMovie localMovie = LocalMovie(
          id: data.id,
          title: data.title,
          overview: data.overview,
          posterPath: data.posterPath,
          favourite: 0);
      await database.addData(localMovie, database.UPCOMMING_TABLE);
    }
  }

  Future<void> updatePopularFavourite(int id, int favourite,
      {bool? fromDetail}) async {
    // print('popular update');
    int data = 0;
    if (fromDetail == null) {
      data = favourite == 0 ? 1 : 0;
    } else {
      data = fromDetail ? 0 : 1;
    }
    await database.updateData(data, id, database.POPULAR_TABLE);
    await getLocalMovie();
    isFavourite.value = data == 0 ? false : true;
    // print('pop ${isFavourite.value}');
  }

  Future<void> updateUpcommingFavourite(int id, int favourite,
      {bool? fromDetail}) async {
    // print('upcoming update $favourite');
    // print('Fav $fromDetail');
    int data = 0;
    if (fromDetail == null) {
      data = favourite == 0 ? 1 : 0;
    } else {
      data = fromDetail ? 0 : 1;
    }
    await database.updateData(data, id, database.UPCOMMING_TABLE);
    await getLocalMovie();
    isFavourite.value = data == 0 ? false : true;
    // print('up ${isFavourite.value}');
  }

  Future<void> initState() async {
    var count = await getDataCount();
    print('Count => $count');
    if (count <= 0) {
      await getPopularMovieList();
      await getUpcomingMovieList();
      await addData();
    }
    await getLocalMovie();
  }

  @override
  void onInit() {
    initState();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
