// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first, directives_ordering

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emerson/app/app.dart';
import 'package:emerson/app/modules/user/repository/i_user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository _userRepository = getItApp.get<IUserRepository>();

  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<void> loadData() async {
    try {
      //  emit(const MovieLoadingState());
      //  final response = await _movieRepository.getMovies();
      //  emit(MovieLoadCompleteState(response!.data as List<MovieResponseModel>),);
    } on Exception catch (e) {
      // if (e is MissingApiKeyException) {
      //   emit(MovieErrorState('Please check the API key'));
      // } else if (e is ApiKeyInvalidException) {
      //   emit(MovieErrorState('La api Key no es valida'));
      // } else {
      //   emit(MovieErrorState('Unknown error'));
      // }
    }
  }
}
