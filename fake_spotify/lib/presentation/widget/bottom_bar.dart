import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_bar_item.dart';

class NavigationBar extends StatefulWidget {
  BuildContext parentContext;

  NavigationBar(this.parentContext);

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
        widget.parentContext.read<NavigatorBloc>().add(GoHomeEvent());
        break;
      case 2:
        widget.parentContext.read<NavigatorBloc>().add(GoSearchEvent());
        break;
      case 3:
        widget.parentContext.read<NavigatorBloc>().add(GoLibraryEvent());
        break;
      case 4:
        widget.parentContext.read<NavigatorBloc>().add(GoPremiumEvent());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("NavigationBarState build: $selectedIdex");
    return Container(
      width: double.infinity,
      height: 60,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              Expanded(
                child: BottomBarItem(
                  key: Key("Home"),
                  name: "Home",
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
