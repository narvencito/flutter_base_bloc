import 'package:emerson/app/app.dart';
import 'package:emerson/app/common/model/api_response_model.dart';
import 'package:emerson/app/modules/movie/repository/i_movie_repository.dart';
import 'package:emerson/app/modules/movie/service/movie_service.dart';

class MovieRepositoryImpl extends IMovieRepository {
  MovieRepositoryImpl();

  final MovieService service = getItApp.get<MovieService>();

  @override
  Future<APIResponseModel?> getMovie() => service.getMovie();

  @override
  Future<APIResponseModel?> getMovies() => service.getMovies();
}
