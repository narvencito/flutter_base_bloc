part of 'anged_bloc.dart';

abstract class AngedEvent extends Equatable {
  const AngedEvent();

  @override
  List<Object> get props => [];
}

class GetInitAngedDataEvent extends AngedEvent {
  @override
  List<String> get props => [];
}
