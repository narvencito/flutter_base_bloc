// ignore_for_file: omit_local_variable_types, prefer_final_locals, lines_longer_than_80_chars, avoid_dynamic_calls, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:emerson/app/app.dart';
import 'package:emerson/app/common/model/api_response_model.dart';
import 'package:emerson/app/modules/movie/model/movie_response_model2.dart';

class MovieService {
  final dio = getItApp.get<Dio>();

  Future<APIResponseModel> getMovies() async {
    APIResponseModel res = APIResponseModel(false, 999, null, '');

    final response = await dio.get('/popular');
    final data = MovieResponseModel2.fromJson(response.data as Map<String, dynamic>);
    if (response.statusCode == 200) {
      res
        ..status = true
        ..statusCode = response.statusCode!
        ..data = data;
    }

    return res;
  }

  Future<APIResponseModel> getMovie() {
    throw UnimplementedError();
  }
}
