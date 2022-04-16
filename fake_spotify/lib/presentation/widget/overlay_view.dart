import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'loader_control.dart';

class OverlayView extends StatelessWidget {
  OverlayView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder<bool>(
        valueListenable: Loader.appLoader.tabbarShowingNotifier,
        builder: (context1, value, child) {
          if (value) {
            return NavigationAppBar();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
