import 'package:app/model/mbook.dart';
import "package:flutter/material.dart";

class XBookCell extends StatelessWidget {
  final MBook bookModel;
  final void Function(MBook book) onTap;
  XBookCell({
    Key key,
    this.bookModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget body = SizedBox(
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
    if (onTap != null) {
      body = GestureDetector(
        onTap: () {
          onTap(bookModel);
        },
        child: body,
      );
    }
    return body;
  }
}
