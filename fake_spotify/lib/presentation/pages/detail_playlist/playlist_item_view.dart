import 'package:flutter/material.dart';

class PlayListItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlayListItemViewState();
}

class PlayListItemViewState extends State<PlayListItemView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text("Lam sao up bo duoc nho le dang fomo, super start",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis))
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "You can style ElevatedButton by using the styleFrom static method or the ButtonStyle class. The first one is more convenience than the second one.",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        SizedBox(
          height: 15,
        ),
        Text("12 mar 2021 * 2 hours 30 mins 30 seconds",
            style: TextStyle(color: Colors.grey, fontSize: 15)),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () {}),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.download_outlined,
                  color: Colors.white,
                ),
                onPressed: () {}),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {}),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
