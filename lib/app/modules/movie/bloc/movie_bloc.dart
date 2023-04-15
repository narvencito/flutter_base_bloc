// ignore_for_file: invalid_use_of_visible_for_testing_member,directives_ordering, lines_longer_than_80_chars
//unnecessary_type_check, sort_constructors_first

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:emerson/app/app.dart';
import 'package:emerson/app/modules/movie/model/movie_response_model.dart';
import 'package:emerson/app/modules/movie/model/movie_response_model2.dart';
import 'package:emerson/app/modules/movie/repository/i_movie_repository.dart';

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
    } on DioError catch (e) {
      //emit(const MovieErrorState('Error al obtener las peliculas'));
      if (e.error is SocketException) {
        emit(const MovieErrorState('No tiene acceso a Internet'));
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
