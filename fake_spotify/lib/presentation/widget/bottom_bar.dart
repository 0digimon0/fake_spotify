import 'package:fake_spotify/constant/dimen_constants.dart';
import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_item.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar();

  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
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

    switch (i) {
      case 1:
        AppInjector.injector<NavigatorBloc>().add(GoHomeEvent());
        break;
      case 2:
        AppInjector.injector<NavigatorBloc>().add(GoSearchEvent());
        break;
      case 3:
        AppInjector.injector<NavigatorBloc>().add(GoLibraryEvent());
        break;
      case 4:
        AppInjector.injector<NavigatorBloc>().add(GoPremiumEvent());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("NavigationBarState build: $selectedIdex");
    return Container(
      color: Colors.black87,
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
