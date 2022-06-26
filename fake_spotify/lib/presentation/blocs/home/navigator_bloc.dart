import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, HomeNavigatorState> {
  NavigatorBloc() : super(InitialState()) {
    debugPrint("NavigatorBloc - on event");
    on<GoHomeEvent>((event, emit) {
      debugPrint("NavigatorBloc - on event - GoHomeEvent");
      emit(NavigateToHome());
    });
    on<GoLibraryEvent>((event, emit) {
      debugPrint("NavigatorBloc - on event - GoLibraryEvent");
      emit(NavigateToLibrary());
    });
    on<GoSearchEvent>((event, emit) {
      debugPrint("NavigatorBloc - on event - GoPremiumEvent");
      emit(NavigateToSearch());
    });
    // on<GoLibraryEvent>((event, emit) => emit(NavigateToLibrary()));
    // on<GoSearchEvent>((event, emit) => emit(NavigateToSearch()));
    on<GoPremiumEvent>((event, emit) => emit(NavigateToPremium()));
    on<GoQueryingEvent>((event, emit) => emit(NavigateToQuerying()));
    on<GoPlaylistEvent>((event, emit) => emit(NavigateToPlaylist()));
  }
}
