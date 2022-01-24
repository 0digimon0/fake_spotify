import 'package:fake_spotify/presentation/widget/publisher_simple_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PublishersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return PublisherSimpleItemView();
          }),
    );
  }
}
