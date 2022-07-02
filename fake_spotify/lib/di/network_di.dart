import 'package:fake_spotify/data/model/connectivity.dart';
import 'package:get_it/get_it.dart';

class NetworkDI {
  NetworkDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<Connectivity>(Connectivity());
  }
}
