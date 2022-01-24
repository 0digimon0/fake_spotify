part of "navigator_bloc.dart";

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object?> get props => [];
}

class GoHomeEvent extends NavigatorEvent {}

class GoSearchEvent extends NavigatorEvent {}

class GoLibraryEvent extends NavigatorEvent {}

class GoPremiumEvent extends NavigatorEvent {}

class GoQueryingEvent extends NavigatorEvent {}

class GoPlaylistEvent extends NavigatorEvent {}
