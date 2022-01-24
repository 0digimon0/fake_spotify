import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CollectionInformationItem extends StatelessWidget {
  final String description =
      "I already looked into flutter_linkify and linkify, but that's not what I want. \nI'm curious if there's already a package or even built into the flutter library.";

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: _width * 0.4,
                  height: _width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                )),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Collection name",
                    style: TextStyle(color: Colors.white, fontSize: 37),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "publisher name",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ))
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          height: 60,
          child: Row(
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2, color: Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Folowing",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              SizedBox(
                width: 15,
              ),
              IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),
              SizedBox(
                width: 15,
              ),
              IconButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        SizedBox(height: 15),
        ExtendableText(description),
      ],
    );
  }
}

class ExtendableText extends StatefulWidget {
  late final String briefText;
  late final String originalText;

  ExtendableText(String text) {
    this.originalText = text;

    if (originalText.length <= 80) {
      briefText = originalText;
    } else {
      briefText = originalText.substring(0, 80) + " ... ";
    }
  }

  @override
  State<StatefulWidget> createState() => ExtendableTextState();
}

class ExtendableTextState extends State<ExtendableText> {
  TextStyle defaultStyle = TextStyle(color: Colors.white, fontSize: 15.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(style: defaultStyle, children: <TextSpan>[
      TextSpan(text: isExpanded ? widget.originalText : widget.briefText),
      isExpanded
          ? TextSpan(
              text: "\ncollapse",
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = false;
                  });
                })
          : TextSpan(
              text: "expand",
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = true;
                  });
                })
    ]));
  }
}
