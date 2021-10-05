import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, HomeNavigatorState> {
  NavigatorBloc() : super(InitialState());

  @override
  Stream<HomeNavigatorState> mapEventToState(NavigatorEvent event) async* {
    debugPrint("NavigatorBloc mapEventToState ");
    if (event is GoHomeEvent) {
      yield NavigateToHome();
    } else if (event is GoLibraryEvent) {
      yield NavigateToLibrary();
    } else if (event is GoSearchEvent) {
      yield NavigateToSearch();
    } else if (event is GoPremiumEvent) {
      yield NavigateToPremium();
    }
  }
}
