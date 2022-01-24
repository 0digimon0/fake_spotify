import 'package:fake_spotify/presentation/widget/collection_item_view.dart';
import 'package:fake_spotify/presentation/widget/subheader_view.dart';
import 'package:flutter/material.dart';

class PopularWithUserPage extends StatelessWidget {
  String suggestionName;

  PopularWithUserPage(this.suggestionName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SubHeader(
            type: Header.HEADER_TYPE_IMAGE,
            header: "pho bien voi nguoi nghe cua",
            subheader: "$suggestionName",
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 230,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CollectionItemView();
                }),
          )
        ],
      ),
    );
  }
}
