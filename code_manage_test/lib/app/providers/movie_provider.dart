import 'package:code_manage_test/app/models/movie_model.dart';
import 'package:code_manage_test/services/http_service.dart';

class MovieProvider {
  final _httpService = HttpService();
  Future<List<Movie>> getPopularMovie() async {
    var response = await _httpService.get('/popular');
    var data = response['results'] as List;
    // print('Popular movie => $data');
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getUpcomingMovie() async {
    var response = await _httpService.get('/upcoming');
    var data = response['results'] as List;
    // print('Upcoming movie => $data');
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }
}
