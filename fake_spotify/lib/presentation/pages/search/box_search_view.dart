import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  GestureTapCallback? onClick;

  SearchBox({onTap: GestureTapCallback}) {
    this.onClick = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.search_rounded),
            Text(
              "Ten bai hat, the loai",
              style: TextStyle(color: Colors.black, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
