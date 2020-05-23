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
          title: Text("School"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return Container(
                  height: 100,
                  color: Colors.black,
                );
              } else {
                return ListTile(
                  leading: Text("asdasd"),
                );
              }
            },
          ),
        ));
  }
}
