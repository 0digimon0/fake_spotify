import 'package:fake_spotify/presentation/blocs/app/app_bloc.dart';
import 'package:fake_spotify/presentation/blocs/app/audio_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';

import 'package:get_it/get_it.dart';

class BlocDI {
  BlocDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<AppBloc>(AppBloc());
    injector.registerSingleton<NavigatorBloc>(NavigatorBloc());
    injector.registerFactory(() => AudioBloc());
  }
}
