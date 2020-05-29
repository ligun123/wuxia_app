import 'package:app/model/mbook.dart';
import "package:flutter/material.dart";

class XBookCell extends StatelessWidget {
  final MBook bookModel;
  XBookCell({
    Key key,
    this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/icon_unknown.jpg",
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
                  bookModel.name,
                  style: theme.textTheme.subhead,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  bookModel.intro,
                  maxLines: 3,
                  style: theme.textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  bookModel.category,
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
