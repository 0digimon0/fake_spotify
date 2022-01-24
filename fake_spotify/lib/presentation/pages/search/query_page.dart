import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QueryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QueryPageState();
}

class QueryPageState extends State<QueryPage> {
  bool isQuerying = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
              height: 110,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Align(
                child: Container(
                  child: isQuerying ? _inputView() : _searchButtonView(),
                  height: 60,
                ),
                alignment: Alignment.bottomCenter,
              ))
        ],
      ),
    );
  }

  Widget _inputView() {
    return Container(
      height: 60,
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.keyboard_backspace_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.pop(context);
                setState(() {
                  isQuerying = false;
                });
              }),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 15),
              autofocus: true,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Enter search name here"),
            ),
          )
        ],
      ),
    );
  }

  Widget _searchButtonView() {
    return InkWell(
      onTap: () {
        setState(() {
          isQuerying = true;
        });
      },
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        color: Colors.deepOrange,
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
