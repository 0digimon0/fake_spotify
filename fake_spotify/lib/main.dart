import 'package:fake_spotify/config/app_config.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/app/app_bloc.dart';
import 'package:fake_spotify/presentation/blocs/app/audio_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_cubit.dart';
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
            create: (context) => AppInjector.injector<NavigatorBloc>()),
        BlocProvider<AudioBloc>(
            create: (context) => AppInjector.injector<AudioBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'Flutter Demo',
        home: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MaterialApp(
              onGenerateRoute: AppRoute.getRoute,
              initialRoute: RouteConstant.initial,
              builder: EasyLoading.init(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),
            Positioned(
              child: OverlayView(key: GlobalKey(debugLabel: "overlay")),
              bottom: 10,
              left: 0,
              right: 0,
            ),
            // Positioned(
            //   child: AudioControlView(),
            //   bottom: Dimens.bottomBarHeight + 10,
            //   left: 0,
            //   right: 0,
            // )
          ],
        ),
      ),
    );
  }
}
