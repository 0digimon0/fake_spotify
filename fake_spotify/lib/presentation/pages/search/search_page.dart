import 'package:fake_spotify/di/app_injector.dart';
import 'package:fake_spotify/presentation/blocs/home/navigator_bloc.dart';
import 'package:fake_spotify/presentation/pages/search/search_style_item.dart';
import 'package:flutter/material.dart';

import 'box_search_view.dart';

TextStyle headerStyle = TextStyle(color: Colors.white, fontSize: 14);

List recentStyle = ["POP", "ROCK"];
List allStyle = [
  "Podcasts",
  "New release",
  "Top global",
  "Show",
  "Home",
  "K-Pop",
  "Hip-hop",
  "Indie",
  "Sleep"
];

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.black,
      child: ListView(
        children: [
          Text(
            "Search",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          SearchBox(
            onTap: () {
              debugPrint(" on tap on search box");
              AppInjector.injector<NavigatorBloc>().add(GoQueryingEvent());
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "most recent listen style",
            style: headerStyle,
          ),
          SizedBox(
            height: 15,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 2,
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctx, index) {
                return SearchStyleItemView(recentStyle[index]);
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            "All style",
            style: headerStyle,
          ),
          SizedBox(
            height: 15,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: allStyle.length,
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctx, index) {
                return SearchStyleItemView(allStyle[index]);
              })
        ],
      ),
    );
  }
}
