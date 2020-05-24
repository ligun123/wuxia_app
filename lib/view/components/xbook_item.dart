import "package:flutter/material.dart";

/**
 * simple of book
 */

class XBookItem extends StatelessWidget {
  XBookItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 135,
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/unknown.jpg",
            width: 75,
            height: 100,
          ),
          Text("The God eater"),
        ],
      ),
    );
  }
}
