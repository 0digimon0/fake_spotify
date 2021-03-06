import 'package:fake_spotify/constant/dimen_constants.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bottom_bar_item.dart';

class NavigationAppBar extends StatefulWidget {
  NavigationAppBar();

  @override
  State<StatefulWidget> createState() => NavigationAppBarState();
}

class NavigationAppBarState extends State<NavigationAppBar> {
  int selectedIdex = 1;

  menuItemClick(int i) {
    debugPrint("NavigationBarState menuItemClick $i");
    if (i == selectedIdex) {
      return;
    } else {
      setState(() {
        selectedIdex = i;
      });
    }

    // NavigatorBloc bloc = GetIt.I.get<NavigatorBloc>();
    switch (i) {
      case 1:
        GetIt.I.get<NavigatorBloc>().add(GoHomeEvent());
        break;
      case 2:
        GetIt.I.get<NavigatorBloc>().add(GoSearchEvent());
        break;
      case 3:
        GetIt.I.get<NavigatorBloc>().add(GoLibraryEvent());
        break;
      case 4:
        GetIt.I.get<NavigatorBloc>().add(GoPremiumEvent());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("NavigationBarState build: $selectedIdex");
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black.withAlpha(144), Colors.black],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      width: double.infinity,
      height: Dimens.bottomBarHeight,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              Expanded(
                child: BottomBarItem(
                  key: Key("Home"),
                  name: "Home",
                  icon: Icon(Icons.home),
                  id: 1,
                  callback: menuItemClick,
                  selected: selectedIdex == 1,
                ),
                flex: 1,
              ),
              Expanded(
                child: BottomBarItem(
                  key: Key("Search"),
                  name: "Search",
                  icon: Icon(Icons.search),
                  id: 2,
                  callback: menuItemClick,
                  selected: selectedIdex == 2,
                ),
                flex: 1,
              ),
              Expanded(
                child: BottomBarItem(
                  key: Key("Library"),
                  name: "Library",
                  icon: Icon(Icons.my_library_books),
                  id: 3,
                  callback: menuItemClick,
                  selected: selectedIdex == 3,
                ),
                flex: 1,
              ),
              Expanded(
                child: BottomBarItem(
                  key: Key("Premium"),
                  name: "Premium",
                  icon: Icon(Icons.access_alarms),
                  id: 4,
                  callback: menuItemClick,
                  selected: selectedIdex == 4,
                ),
                flex: 1,
              )
            ],
          )),
    );
  }
}
