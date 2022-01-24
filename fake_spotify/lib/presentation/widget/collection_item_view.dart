import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double COLECTION_WIDTH = 150;

class CollectionItemView extends StatelessWidget {
  GestureTapCallback? onTap;

  CollectionItemView({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: COLECTION_WIDTH + 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Container(
                width: COLECTION_WIDTH,
                height: COLECTION_WIDTH,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Chang ngoc gia",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Pdr, Nguyen Tri' Tue",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
