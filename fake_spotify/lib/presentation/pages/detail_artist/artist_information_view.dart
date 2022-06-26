import 'package:flutter/material.dart';

class ArtistInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1.923.441 people folowing now",
              style: TextStyle(color: Colors.blueGrey, fontSize: 16)),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "follow",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              "Taylor love story - Taylor Blank space - Taylor shake it off - Taylor Bad blood - Taylor lover - Taylor Look What You Made Me Do",
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
    ;
  }
}
