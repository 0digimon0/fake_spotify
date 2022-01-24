import 'package:fake_spotify/constant/route_constants.dart';
import 'package:fake_spotify/presentation/widget/collection_item_view.dart';
import 'package:fake_spotify/presentation/widget/subheader_view.dart';
import 'package:flutter/material.dart';

class CollectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeader(type: Header.HEADER_TYPE_TEXT, header: "Collection"),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CollectionItemView(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteConstant.playlist);
                      // AppInjector.injector<NavigatorBloc>().add(GoPlaylistEvent());
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
