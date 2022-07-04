import 'package:fake_spotify/config/app_config.dart';
import 'package:fake_spotify/constant/dimen_constants.dart';
import 'package:fake_spotify/data/model/connectivity.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/app/app_bloc.dart';
import 'package:fake_spotify/presentation/blocs/app/audio_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_cubit.dart';
import 'package:fake_spotify/presentation/pages/library/connection.dart';
import 'package:fake_spotify/presentation/widget/overlay_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import 'config/app_route.dart';
import 'constant/route_constants.dart';
import 'helper/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().configApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _eventChannel =
      const EventChannel('platform_channel_events/connectivity');

  @override
  Widget build(BuildContext context) {
    final networkStream = _eventChannel
        .receiveBroadcastStream()
        .distinct()
        .map((dynamic event) => Utils.intToConnection(event as int));

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
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute.getRoute,
              initialRoute: RouteConstant.initial,
              builder: EasyLoading.init(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),

            StreamBuilder<Connection>(
                initialData: Connection.unknown,
                stream: networkStream,
                builder: (context, snapshot) {
                  final connection = snapshot.data ?? Connection.unknown;
                  GetIt.I.get<Connectivity>().connectionState = connection;
                  debugPrint('event stream channel changed ${connection.name}');
                  return Visibility(
                      visible: (connection == Connection.unknown ||
                          connection == Connection.disconnected),
                      child: Positioned(
                        child: Container(
                          color: Colors.red, height: 30,
                        child: Text('No network connection, please check again', style: TextStyle(color: Colors.white, fontSize: 14),),alignment: Alignment.center,),
                        bottom: Dimens.bottomBarHeight,
                        left: 0,
                        right: 0,
                      ));
                }),

            Positioned(
              child: OverlayView(key: GlobalKey(debugLabel: "overlay")),
              bottom: 0,
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
