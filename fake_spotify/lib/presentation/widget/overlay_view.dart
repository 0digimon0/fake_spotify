import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'loader_control.dart';

class OverlayView extends StatelessWidget {
  const OverlayView({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Loader.appLoader.loaderShowingNotifier,
      builder: (context1, value, child) {
        if (value) {
          return NavigationBar(context);
        } else {
          return Container();
        }
      },
    );
  }
}
