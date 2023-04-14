// ignore_for_file: lines_longer_than_80_chars, file_names, cascade_invocations

import 'package:dio/dio.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/config/flavor_config.dart';
import 'package:movie/app/modules/movie/repository/i_movie_repository.dart';
import 'package:movie/app/modules/movie/repository/movie_repository_impl.dart';
import 'package:movie/app/modules/movie/service/movie_service.dart';
import 'package:movie/app/modules/user/repository/i_user_repository.dart';
import 'package:movie/app/modules/user/repository/user_repository_impl.dart';
import 'package:movie/app/modules/user/service/user_service.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DependencyInjection {
  void setup() {
    final dio = Dio(
      BaseOptions(
        baseUrl: InitFlavorConfig.urlApp,
        contentType: 'application/json',
        queryParameters: {'api_key': '5927f7059d649ac95ab1e3196f25ec1c'},
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OTI3ZjcwNTlkNjQ5YWM5NWFiMWUzMTk2ZjI1ZWMxYyIsInN1YiI6IjY0MzM3MGFlNDUzOWQwMDA3NzdkY2Y4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L1JQer6r24sNHK8fZnYDOWE-fEwagpO-KPIKIRiWOIk',
        },
      ),
    );
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printRequestHeaders: true, printResponseHeaders: true, printResponseData: false),
      ),
    );
    getItApp.registerLazySingleton(() => dio);
    getItApp.registerLazySingleton<IUserRepository>(UserRepositoryImpl.new);
    getItApp.registerLazySingleton(UserService.new);
    getItApp.registerLazySingleton<IMovieRepository>(MovieRepositoryImpl.new);
    getItApp.registerLazySingleton(MovieService.new);
  }
}
