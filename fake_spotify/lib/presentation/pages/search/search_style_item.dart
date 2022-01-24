import 'package:flutter/material.dart';

class SearchStyleItemView extends StatelessWidget {
  final String styleName;

  SearchStyleItemView(this.styleName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Stack(
        children: [
          Container(
            child: Text(
              styleName,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            margin: EdgeInsets.all(15),
          ),
          Positioned(
            right: -20,
            top: 30,
            child: Transform.rotate(
              angle: 90,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
