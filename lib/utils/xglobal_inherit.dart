import 'package:app/model/mbook.dart';
import 'package:flutter/material.dart';

class XGlobalInherited extends InheritedWidget {
  XGlobalInherited({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  List<MBook> bookshelf;

  static XGlobalInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<XGlobalInherited>();
  }

  @override
  bool updateShouldNotify(XGlobalInherited oldWidget) {
    return true;
  }

  /**
   * bookshelf
   * .add
   * .subtract
   * .update
   */

  bookshelfAdd(MBook book) {
    bookshelf.add(book);
  }

  bookshelfSubtract(MBook book) {
    bookshelf.removeWhere((test) {
      return test.uid == book.uid;
    });
  }

  bookshelfUpdate(MBook book) {
    final index = bookshelf.indexWhere((test) {
      return test.uid == book.uid;
    });
    bookshelf[index] = book;
  }
}
