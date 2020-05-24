import "package:flutter/material.dart";

/**
 * simple of book
 */

class XBookItem extends StatelessWidget {
  XBookItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/unknown.jpg",
            width: 75,
            height: 100,
          ),
          Text(
            "The God eater asdasdasdasasdasdasdasdadsd",
            // style: theme.textTheme.subhead,
            maxLines: 3,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
