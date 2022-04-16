import 'package:flutter/material.dart';

class DetailArtistPage extends StatelessWidget {
  final double imageHeight = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: imageHeight,
            pinned: true,
            snap: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/image/taylor_swift.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Taylor Swift",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                if (index == 0) {
                  return Container(
                    height: 150,
                    color: Colors.black,
                  );
                }
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
