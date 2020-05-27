import 'package:flutter/material.dart';

class XCategoryBanner extends StatelessWidget {
  const XCategoryBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: <Widget>[
          XCategoryItem(),
          XCategoryItem(),
          XCategoryItem(),
          XCategoryItem(),
          XCategoryItem(),
          XCategoryItem(),
        ],
      ),
    );
  }
}

class XCategoryItem extends StatelessWidget {
  const XCategoryItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Theme.of(context).buttonColor),
      ),
      width: 93,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset("assets/icon_fantasy.png"),
          Text(
            "Fantasy",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subhead,
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: () {
        //TODO:跳转category列表
      },
      child: body,
    );
  }
}
