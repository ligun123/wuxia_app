import 'package:app/model/mbook.dart';
import 'package:app/model/xmodel.dart';

class MBookGroup extends XModel {
  List<MBook> books;
  String section;

  MBookGroup({
    this.books,
    this.section,
  });

  factory MBookGroup.fromJson(Map<String, dynamic> json) => MBookGroup(
        books: (json["books"] as List).map((json) {
          return MBook.fromJson(json);
        }).toList(),
        section: json["section"] as String,
      );

  Map<String, dynamic> toJson() => {
        "sections": section,
        "new": List<dynamic>.from(books.map((x) => x.toJson())),
      };

  MBook getBookAtIndex(int index) {
    return index < books.length ? books[index] : null;
  }
}
