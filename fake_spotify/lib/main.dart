import 'package:fake_spotify/config/app_config.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/app/app_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/widget/overlay_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'config/app_route.dart';
import 'constant/route_constants.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();  ????
  await AppConfig().configApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
            create: (context) => AppInjector.injector<AppBloc>()),
        BlocProvider<NavigatorBloc>(
            create: (context) => AppInjector.injector<NavigatorBloc>())
      ],
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute.getRoute,
            initialRoute: RouteConstant.initial,
            builder: EasyLoading.init(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          ),
          OverlayView(key: GlobalKey(debugLabel: "overlay")),
        ],
      ),
    );
  }
}
