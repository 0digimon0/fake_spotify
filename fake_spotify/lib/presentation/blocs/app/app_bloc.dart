import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    // AppInjector.injector<CustomInterceptors>().onErrorStream.listen((err) {
    //   // Check status for logout
    //   logi.d(
    //     'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}');
    // });
  }
}
