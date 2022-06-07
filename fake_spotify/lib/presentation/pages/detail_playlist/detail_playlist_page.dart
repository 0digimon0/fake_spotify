import 'package:flutter/material.dart';

import 'collection_info_item.dart';
import 'playlist_item_view.dart';

class DetailPlaylistPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailPlayListPageState();
}

class DetailPlayListPageState extends State<DetailPlaylistPage> {
  late final ScrollController _controller;
  double opacity = 0;

  _scrollListener() {
    var _currectScrollPosition = _controller.position.pixels;
    setState(() {
      if (_currectScrollPosition > 100) {
        opacity = 1;
      } else if (_currectScrollPosition <= 0) {
        opacity = 0;
      } else {
        opacity = _currectScrollPosition / 100;
      }
    });
  }

  initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.cyan.withOpacity(opacity),
              title: Text(
                "name of collection",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  controller: _controller,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CollectionInformationItem();
                    } else if (index == 1) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              "All audio",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Sort",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                      );
                    } else {
                      return PlayListItemView();
                    }
                  }),
            )));
  }
}
