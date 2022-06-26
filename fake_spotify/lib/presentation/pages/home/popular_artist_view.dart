import 'package:fake_spotify/constant/route_constants.dart';
import 'package:fake_spotify/presentation/widget/subheader_view.dart';
import 'package:flutter/material.dart';

class PopularArtistView extends StatelessWidget {
  String subHeaderTitle = "Popular Artists";

  PopularArtistView({required this.subHeaderTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeader(type: Header.HEADER_TYPE_TEXT, header: subHeaderTitle),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteConstant.artist);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                "https://s3.o7planning.com/images/boy-128.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tayor Swift",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
