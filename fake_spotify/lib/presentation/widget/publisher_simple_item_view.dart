import 'package:flutter/material.dart';

const double ITEM_HEIGHT = 60;
const double ITEM_WIDTH = 180;
const double ROUNDED_VALUE = 5;

class PublisherSimpleItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ROUNDED_VALUE)),
        color: Colors.white10,
      ),
      margin: EdgeInsets.only(right: 10),
      width: ITEM_WIDTH,
      height: ITEM_HEIGHT,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(ROUNDED_VALUE)),
        child: Row(
          children: [
            Container(
              width: ITEM_HEIGHT,
              height: ITEM_HEIGHT,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              "Hieu.TV",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
          ],
        ),
      ),
    );
  }
}
