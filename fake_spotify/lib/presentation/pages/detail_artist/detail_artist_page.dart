import 'package:fake_spotify/constant/dimen_constants.dart';
import 'package:fake_spotify/presentation/pages/detail_artist/artist_albums_view.dart';
import 'package:fake_spotify/presentation/pages/detail_artist/artist_information_view.dart';
import 'package:fake_spotify/presentation/widget/album_item_view.dart';
import 'package:flutter/material.dart';

import '../home/collection_view.dart';
import '../home/popular_artist_view.dart';

class DetailArtistPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailArtistPageState();
}

class DetailArtistPageState extends State<DetailArtistPage> {
  final double imageHeight = 200;
  double opacity = 0;
  double space = 20;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double scrollOffset = _scrollController.offset;
      if (scrollOffset >= 0 && scrollOffset <= imageHeight) {
        setState(() {
          opacity = scrollOffset / imageHeight;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
      Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/taylor_swift.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(1 - opacity),
                      BlendMode.modulate,
                    ))),
          )),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.blue.withOpacity(opacity)),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Taylor Swift",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
                Container(
                  color: Colors.black,
                  child: Column(children: [
                    SizedBox(
                      height: space,
                    ),
                    ArtistInformationView(),
                    SizedBox(
                      height: space,
                    ),
                    AlbumsView(),
                    SizedBox(
                      height: space,
                    ),
                    PopularArtistView(subHeaderTitle: 'Fan cung thich'),
                    SizedBox(
                      height: space,
                    ),
                    CollectionView(collectionName: "Tac gia gioi thieu ban"),
                    SizedBox(
                      height: Dimens.bottomBarHeight,
                    )
                  ]),
                ),
              ],
            )),
      ),
    ]);
  }

  ScrollController _scrollController = ScrollController();
}



// CustomScrollView(
//         physics: ClampingScrollPhysics(),
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: imageHeight,
//             pinned: true,
//             snap: false,
//             floating: false,
//             flexibleSpace: Stack(
//               children: <Widget>[
//                 Positioned.fill(
//                   child: Image.network(
//                     "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         "Taylor Swift",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 26.0,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               ArtistInformationView(),
//               SizedBox(
//                 height: 10,
//               ),
//               AlbumsView(),
//               SizedBox(
//                 height: 50,
//               )
//             ]),
//           ),
//         ],
//       )            )