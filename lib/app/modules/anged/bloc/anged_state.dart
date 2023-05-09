// ignore_for_file: must_be_immutable

part of 'anged_bloc.dart';

abstract class AngedState extends Equatable {
  const AngedState();

  @override
  List<Object> get props => [];
}

class AngedDataInitialState extends AngedState {
  AngedDataInitialState(
    this.words,
    this.numErrors,
    this.numAttempts,
    this.assetError,
  );

  List<String> words;
  final int numErrors;
  final int numAttempts;
  final String assetError;

  @override
  List<Object> get props => [words, numErrors, numAttempts, assetError];
}

class AngedErrorState extends AngedState {
  const AngedErrorState(
    this.message,
    this.errorAssets,
    this.numErrors,
    this.numAttempts,
  );

  final String message;
  final String errorAssets;
  final int numErrors;
  final int numAttempts;

  @override
  List<Object> get props => [message, errorAssets, numErrors, numAttempts];
}
