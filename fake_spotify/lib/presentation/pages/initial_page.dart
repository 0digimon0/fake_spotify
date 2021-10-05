import 'package:fake_spotify/constant/route_constants.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/widget/loader_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Loader.appLoader.showLoader();
      Navigator.of(context).pushNamed(RouteConstant.home);
    });
    return BlocListener<NavigatorBloc, HomeNavigatorState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          debugPrint("HomeContent listener NavigateToHome");
          Navigator.of(context).pushNamed(RouteConstant.home);
        } else if (state is NavigateToLibrary) {
          Navigator.of(context).pushNamed(RouteConstant.library);
        } else if (state is NavigateToPremium) {
          Navigator.of(context).pushNamed(RouteConstant.premium);
        } else if (state is NavigateToSearch) {
          Navigator.of(context).pushNamed(RouteConstant.search);
        }
      },
      child: Container(
        child: Center(
          child: Text("Initial Content"),
        ),
      ),
    );
  }
}
