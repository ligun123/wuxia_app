import 'package:app/view/components/xbook_detail_banner.dart';
import 'package:app/view/components/xchapter_cell.dart';
import 'package:flutter/material.dart';

class XBookView extends StatefulWidget {
  XBookView({Key key}) : super(key: key);

  _XBookViewState createState() => _XBookViewState();
}

class _XBookViewState extends State<XBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Name"),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FlatButton(
            child: Text("data"),
          ),
          FlatButton(
            child: Text("data"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10 + 1,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return XBookDetailBanner();
          } else if (index == 1) {
            return XBookIntro();
          } else if (index == 2) {
            return _buildChapterHeader(context);
          } else {
            return XChapterCell();
          }
        },
      ),
    );
  }

  Widget _buildChapterHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 48,
      color: Theme.of(context).cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Updated at 2020-05-26",
                  style: theme.textTheme.subtitle.copyWith(
                    color: theme.accentColor,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Chapter1999asdasdasdasdasdasd",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.caption.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.buttonColor,
          ),
        ],
      ),
    );
  }
}
