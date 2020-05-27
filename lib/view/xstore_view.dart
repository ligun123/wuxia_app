import 'package:app/view/components/xbook_group_view.dart';
import 'package:app/view/components/xcategory_banner.dart';
import "package:app/xroutes.dart";
import "package:flutter/material.dart";

class XStoreView extends StatefulWidget {
  XStoreView({Key key}) : super(key: key);

  _XStoreViewState createState() => _XStoreViewState();
}

class _XStoreViewState extends State<XStoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return XCategoryBanner();
            } else {
              return XBookGroupView();
            }
          },
        ),
      ),
    );
  }
}
