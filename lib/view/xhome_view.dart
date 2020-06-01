import 'package:app/view/components/xbook_cell.dart';
import 'package:flutter/material.dart';

class XHomeView extends StatefulWidget {
  XHomeView({Key key}) : super(key: key);

  _XHomeViewState createState() => _XHomeViewState();
}

class _XHomeViewState extends State<XHomeView> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  
  @override
  void initState() {
    print("_XHomeViewState initState");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 4,
              bottom: 4,
            ),
            child: XBookCell(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    print("_XHomeViewState dispose");
    super.dispose();
  }
}
