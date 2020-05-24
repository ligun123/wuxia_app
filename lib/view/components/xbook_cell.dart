import "package:flutter/material.dart";

class XBookCell extends StatelessWidget {
  XBookCell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/unknown.jpg",
            width: 75,
            height: 100,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 4),
                Text(
                  "title name",
                  style: theme.textTheme.subhead,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '''Traversing into another world, Zhang Xuan finds himself becoming an honorable teacher.Along with his transcension, a mysterious library appears in his mind.As long as it is something he has seen, regardless of whether it is a human or an object, a book on its weaknesses will be automatically compiled in the library.Thus, he becomes formidable.''',
                  maxLines: 3,
                  style: theme.textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "Category",
                  style: theme.textTheme.overline,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
