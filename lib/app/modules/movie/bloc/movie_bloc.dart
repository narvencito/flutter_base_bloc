// ignore_for_file: invalid_use_of_visible_for_testing_member,
//unnecessary_type_check, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/modules/movie/model/movie_response_model.dart';
import 'package:movie/app/modules/movie/model/movie_response_model2.dart';
import 'package:movie/app/modules/movie/repository/i_movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieLoadingState()) {
    on<MovieEvent>((event, emit) async {
      //on<GetMovieDataEvent>(_getMovieDataEvent);
    });
  }

  final IMovieRepository _movieRepository = getItApp.get<IMovieRepository>();

  Future<void> loadMovies() async {
    try {
      emit(const MovieLoadingState());
      final response = await _movieRepository.getMovies();
      emit(MovieLoadCompleteState(response!.data as MovieResponseModel2));
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // void _getMovieDataEvent(
  //   GetMovieDataEvent event,
  //   Emitter<MovieState> emitter,
  // ) async {
  //   emitter(const MovieLoadingState());
  //   final response = await _movieRepository.getMovies();
  //   emit(MovieLoadCompleteState(response!.data as List<MovieResponseModel>));
  // }
}
