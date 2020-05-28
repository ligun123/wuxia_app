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
            width: MediaQuery.of(context).size.width - 32 - 75 - 8,
            height: bookHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "halloworldhalloworldhalloworldhalloworldhalloworldhallo worldhallo worldhallo world",
                  style: textTheme.subtitle.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Auther Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Category",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Status",
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
  XBookIntro({Key key}) : super(key: key);

  _XBookIntroState createState() => _XBookIntroState();
}

class _XBookIntroState extends State<XBookIntro> {
  bool isFull = false;
  @override
  Widget build(BuildContext context) {
    final body = Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      child: _buildText(
          "askldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasdaskldjaklsdjklasd"),
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
