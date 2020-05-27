import 'package:flutter/material.dart';

class XBookDetailBanner extends StatefulWidget {
  XBookDetailBanner({Key key}) : super(key: key);

  _XBookDetailBannerState createState() => _XBookDetailBannerState();
}

class _XBookDetailBannerState extends State<XBookDetailBanner> {
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
            height: bookHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Book Name",
                  style: textTheme.subtitle.copyWith(fontSize: 16),
                ),
                Text("Auther Name"),
                Text("Category"),
                Text("Status"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
