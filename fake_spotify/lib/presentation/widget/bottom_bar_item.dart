import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final void Function(int) callback;

  BottomBarItem(
      {Key? key,
      required this.name,
      required this.id,
      this.selected = false,
      required this.callback})
      : super(key: key);

  final String name;
  final int id;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(id);
      },
      child: Container(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: selected ? Colors.white : Colors.white24),
            )
          ],
        ),
      ),
    );
  }
}
