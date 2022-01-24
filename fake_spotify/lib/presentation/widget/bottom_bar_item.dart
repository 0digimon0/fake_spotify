import 'package:fake_spotify/constant/dimen_constants.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final void Function(int) callback;

  BottomBarItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.id,
      this.selected = false,
      required this.callback})
      : super(key: key);

  final String name;
  final int id;
  final Icon icon;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(id);
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: Dimens.bottomBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                icon.icon,
                color: selected ? Colors.white : Colors.white24,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.white24,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
