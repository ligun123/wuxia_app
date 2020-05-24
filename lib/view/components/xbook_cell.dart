import "package:flutter/material.dart";

class XBookCell extends StatelessWidget {
  XBookCell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/unknown.jpg",
            width: 75,
            height: 100,
          ),
          SizedBox(width: 16),
          Column(
            children: <Widget>[
              Text("title name"),
              Text("Intro"),
              Text("Category"),
            ],
          ),
        ],
      ),
    );
  }
}
