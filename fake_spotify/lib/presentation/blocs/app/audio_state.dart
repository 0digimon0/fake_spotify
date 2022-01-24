part of 'audio_bloc.dart';

abstract class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object?> get props => [];
}

class AudioInitialState extends AudioState {}

class PrepareAudioState extends AudioState {}

class LoadingAudioState extends AudioState {}

class LoadedAudioState extends AudioState {}

class PlayingAudioState extends AudioState {}

class PauseAudioState extends AudioState {}

class NextAudioState extends AudioState {}

class PreviousAudioState extends AudioState {}
