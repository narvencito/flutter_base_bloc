part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieLoadingState extends MovieState {
  const MovieLoadingState();
  @override
  List<Object> get props => [];
}

class MovieLoadCompleteState extends MovieState {
  const MovieLoadCompleteState(this.response);

  final MovieResponseModel2 response;

  @override
  List<Object> get props => [response];
}

class MovieErrorState extends MovieState {
  const MovieErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
