

import 'dart:convert';

import 'package:app/model/mbook.dart';
import 'package:app/utils/xdb_manager.dart';

class MBookshelf {
  List<MBook> books;
  MBookshelf({this.books});

  void add(MBook book) {
    if (hasBook(book) == false) {
      books.add(book);
      save();
    }
  }

  void remove(MBook book) {
    books.removeWhere((test) => test.uid == book.uid);
    save();
  }

  void update(MBook book) {
    final index = books.indexWhere((test) => test.uid == book.uid);
    if (index >= 0) {
      books[index] = book;
      save();
    }
  }


  bool hasBook(MBook book) {
    final index = books.indexWhere((test) {
      return test.uid == book.uid;
    });
    return index >= 0;
  }

  void save() async {
    final key = "bookshelf";
    await XDBManager.shared.openDB();
    String shelfString = await XDBManager.shared.getValue(key);
    final shelfJson = books.map<Map<String, dynamic>>((f) => f.toJson()).toList();
    shelfString = jsonEncode(shelfJson);
    XDBManager.shared.setKeyAndValue(key, shelfString);
  }
}