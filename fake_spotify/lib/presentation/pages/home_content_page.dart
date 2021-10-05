import 'package:fake_spotify/constant/route_constants.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  late OverlayEntry _overlayEntry;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _insertOverlay(context));
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
          child: Text("Home Content"),
        ),
      ),
    );
  }

  OverlayEntry _createOverLayEntry(BuildContext context2) {
    return OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        width: size.width,
        height: 60,
        top: size.height - 75,
        left: 0,
        child: Material(
          color: Colors.transparent,
          child: NavigationBar(context2),
        ),
      );
    });
  }

  void _insertOverlay(BuildContext context) {
    _overlayEntry = _createOverLayEntry(context);
    return Overlay.of(context)!.insert(_overlayEntry);
  }
}
// BlocProvider.of<NavigatorBloc>(context2).add(GoHomeEvent());
