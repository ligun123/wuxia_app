import 'package:app/model/MBookshelf.dart';
import 'package:flutter/material.dart';

class XGlobalInherited extends InheritedWidget {
  XGlobalInherited({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  MBookshelf bookshelf = MBookshelf();

  static XGlobalInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<XGlobalInherited>();
  }

  @override
  bool updateShouldNotify(XGlobalInherited oldWidget) {
    return true;
  }
}
