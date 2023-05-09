import 'package:bloc/bloc.dart';
import 'package:emerson/app/modules/anged/model/anged_model.dart';
import 'package:equatable/equatable.dart';

part 'anged_event.dart';
part 'anged_state.dart';

class AngedBloc extends Bloc<AngedEvent, AngedState> {
  AngedBloc()
      : super(
          AngedDataInitialState(['Angular', 'React', 'Vuejs'], 0, 4, 'assets/anged/0.png'),
        ) {
    on<GetInitAngedDataEvent>(_getInitAngedData);
    // on<AngedEvent>((event, emit) async {
    //   on<GetInitAngedDataEvent>(_getInitAngedData);
    // });
  }

  List<String> words = ['Angular', 'React', 'Vuejs'];
  int indexWords = 0;
  String word = '';
  String selectedLetter = '';
  int maxNumErros = 4;
  int numAttempts = 0;
  int numErrors = 0;
  List<AngedModel> wordSearch = [];
  List<bool> wordSearchBool = [];
  String messageError = 'Perdiste, ya no tienes mas vidas, suerte a la proxima';
  String imageAnged = '';

  void loadInitial() {
    // emit(const MovieLoadingState());
    // final response = await _movieRepository.getMovies();
    // emit(MovieLoadCompleteState(response!.data as MovieResponseModel2));
  }

  void _getInitAngedData(
    GetInitAngedDataEvent event,
    Emitter<AngedState> emitter,
  ) {}
  // void _getMovieDataEvent(
  //   GetMovieDataEvent event,
  //   Emitter<MovieState> emitter,
  // ) async {
  //   emitter(const MovieLoadingState());
  //   final response = await _movieRepository.getMovies();
  //   emit(MovieLoadCompleteState(response!.data as List<MovieResponseModel>));
  // }
}
