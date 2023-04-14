part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetMovieDataEvent extends MovieEvent {
  @override
  List<MovieResponseModel?> get props => [];
}
