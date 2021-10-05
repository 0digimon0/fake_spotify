import 'package:fake_spotify/constant/color_constant.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppConfig {
  static final AppConfig _appConfig = AppConfig._();

  factory AppConfig() {
    return _appConfig;
  }
  AppConfig._();

  Future<void> configApp() async {
    await AppInjector.initializeDependencies(); //buildMode: BuildMode.dev
    configLoading();
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = ColorConstants.whiteColor
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = ColorConstants.blackColor.withOpacity(0.8)
      ..indicatorColor = ColorConstants.whiteColor
      ..maskColor = ColorConstants.blackColor.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
