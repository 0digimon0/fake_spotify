import 'package:flutter/material.dart';

class HeaderMenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            "Chao buoi toi",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.history_outlined, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {})
        ],
      ),
    );
  }
}
