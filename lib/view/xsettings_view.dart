import "package:app/xroutes.dart";
import "package:flutter/material.dart";

class XSettingsView extends StatefulWidget {
  XSettingsView({Key key}) : super(key: key);

  _XSettingsViewState createState() => _XSettingsViewState();
}

class _XSettingsViewState extends State<XSettingsView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: GestureDetector(
        child: Center(
          child: Text("Settings"),
        ),
        onTap: () {
          XRoutes.push(context, "XSubView", arguments: ["Settings->SubView"]);
        },
      ),
    );
  }
}