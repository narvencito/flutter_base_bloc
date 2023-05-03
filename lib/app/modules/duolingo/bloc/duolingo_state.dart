part of 'duolingo_bloc.dart';

abstract class DuolingoState extends Equatable {
  const DuolingoState();
  
  @override
  List<Object> get props => [];
}

class DuolingoInitial extends DuolingoState {}
