import 'package:app/view/components/xbook_detail_banner.dart';
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
          } else {
            return ListTile(
              leading: Text("Chapter $index xxx"),
              trailing: Image.asset(
                "assets/icon_star.png",
                width: 22,
                height: 22,
              ),
            );
          }
        },
      ),
    );
  }
}
