import 'package:fake_spotify/presentation/widget/album_item_view.dart';
import 'package:flutter/material.dart';

class AlbumsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("Popular release",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: ((context, index) {
              return AlbumItemView();
            }),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Explore more albums",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.white),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
          ),
        ],
      ),
    );
  }
}
