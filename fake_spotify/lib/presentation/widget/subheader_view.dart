import 'package:flutter/material.dart';

class Header {
  static const HEADER_TYPE_TEXT = 1;
  static const HEADER_TYPE_IMAGE = 2;
}

class SubHeader extends StatelessWidget {
  int type;
  String header;
  String? subheader;
  String? url;
  SubHeader(
      {required this.type, required this.header, this.subheader, this.url});

  @override
  Widget build(BuildContext context) {
    if (type == Header.HEADER_TYPE_TEXT) {
      return Container(
        height: 30,
        child: Text(
          header,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
    } else {
      return Container(
        height: 50,
        child: Row(
          children: [
            ClipRRect(
              child: Container(
                width: 40,
                height: 40,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subheader ?? "untitle",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ))
          ],
        ),
      );
    }
    ;
  }
}
