import 'package:fake_spotify/di/page_di.dart';
import 'package:get_it/get_it.dart';

import 'bloc_di.dart';
import 'network_di.dart';

class AppInjector {
  AppInjector._();

  static final injector = GetIt.instance;

  static Future<void> initializeDependencies() async {
    //{required BuildMode buildMode}
    await NetworkDI.init(injector);
    // await ApiDI.init(injector);
    // await ServiceDI.init(injector);
    await BlocDI.init(injector);
    // await LocalDbDI.init(injector);
    await PageDI.init(injector);
  }
}
