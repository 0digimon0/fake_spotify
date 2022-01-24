import 'package:fake_spotify/presentation/pages/home/popular_artist_view.dart';
import 'package:fake_spotify/presentation/pages/home/popular_with_user_view.dart';
import 'package:fake_spotify/presentation/pages/home/collection_view.dart';
import 'package:fake_spotify/presentation/pages/home/publishers_view.dart';
import 'package:fake_spotify/presentation/widget/welcome_menu_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ListView(
          children: [
            HeaderMenuView(),
            SizedBox(
              height: 10,
            ),
            PublishersView(),
            SizedBox(
              height: 10,
            ),
            CollectionView(),
            SizedBox(
              height: 10,
            ),
            PopularWithUserPage("HIEU.TV"),
            SizedBox(
              height: 10,
            ),
            PopularWithUserPage("DAC NHAN TAM - MYTIVY (FULL 120 MINUTES)"),
            SizedBox(
              height: 10,
            ),
            PopularArtistView(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
