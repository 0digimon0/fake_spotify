part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object?> get props => [];
}

class PrepareEvent extends AudioEvent {}

class PlayEvent extends AudioEvent {}

class PauseEvent extends AudioEvent {}
