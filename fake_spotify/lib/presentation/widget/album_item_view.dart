import 'package:flutter/material.dart';

class AlbumItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.black,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blueGrey,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mot thoi de nho",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text(
                "New release - Album",
                style: TextStyle(color: Colors.blueGrey, fontSize: 17),
              )
            ],
          )
        ],
      ),
    );
  }
}
