import 'package:app/model/mbook.dart';
import 'package:flutter/material.dart';

class XBookDetailBanner extends StatelessWidget {
  final MBook book;
  XBookDetailBanner({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookHeight = 100.0;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/icon_unknown.jpg",
            width: 75,
            height: bookHeight,
          ),
          SizedBox(width: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32 - 75 - 8,
            height: bookHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  book.name,
                  style: textTheme.subtitle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class XBookIntro extends StatefulWidget {
  final String intro;
  XBookIntro({Key key, this.intro}) : super(key: key);

  _XBookIntroState createState() => _XBookIntroState();
}

class _XBookIntroState extends State<XBookIntro> {
  bool isFull = false;
  @override
  Widget build(BuildContext context) {
    final body = Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      child: _buildText(widget.intro),
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          isFull = !isFull;
        });
      },
      child: body,
    );
  }

  Widget _buildText(String data) {
    if (isFull) {
      return Text(data);
    } else {
      return Text(
        data,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      );
    }
  }
}
