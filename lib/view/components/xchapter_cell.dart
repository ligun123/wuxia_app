import 'package:app/model/mchapter.dart';
import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';

class XChapterCell extends StatelessWidget {
  final MChapterSimple chapter;
  const XChapterCell({Key key, this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 32,
      alignment: Alignment.centerLeft,
      child: Text(chapter.name),
    );
    return GestureDetector(
      onTap: () {
        XRoutes.push(context, "XChapterView");
      },
      child: body,
    );
  }
}
