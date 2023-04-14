import 'package:movie/app/common/model/api_response_model.dart';

abstract class IMovieRepository {
  Future<APIResponseModel?> getMovies();
  Future<APIResponseModel?> getMovie();
}
