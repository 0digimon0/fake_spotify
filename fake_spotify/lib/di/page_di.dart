import 'package:fake_spotify/constant/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:fake_spotify/presentation/pages/pages.dart';

class PageDI {
  PageDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory<Widget>(() => InitialPage(),
        instanceName: RouteConstant.initial);

    injector.registerFactory<Widget>(() => HomePage(),
        instanceName: RouteConstant.home);

    injector.registerFactory<Widget>(() => SearchPage(),
        instanceName: RouteConstant.search);

    injector.registerFactory<Widget>(() => LibraryPage(),
        instanceName: RouteConstant.library);

    injector.registerFactory<Widget>(() => PreminumPage(),
        instanceName: RouteConstant.premium);
  }
}
