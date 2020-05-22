import 'package:app/model/xmodel.dart';

class MChapter extends XModel {
  int id;
  String name;
  String spiderUrl;
  int bookId;
  int cindex;
  String content;
  int wordCount;
  int readCount;
  int time;

  MChapter({
    this.id,
    this.name,
    this.spiderUrl,
    this.bookId,
    this.cindex,
    this.content,
    this.wordCount,
    this.readCount,
    this.time,
  });

  factory MChapter.fromJson(Map<String, dynamic> json) => MChapter(
        id: json["id"],
        name: json["name"],
        spiderUrl: json["spider_url"],
        bookId: json["book_id"],
        cindex: json["cindex"],
        content: json["content"],
        wordCount: json["word_count"],
        readCount: json["read_count"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "spider_url": spiderUrl,
        "book_id": bookId,
        "cindex": cindex,
        "content": content,
        "word_count": wordCount,
        "read_count": readCount,
        "time": time,
      };

}

/**
 * 简易的Chapter
 */
class MChapterSimple extends XModel {
  int id;
  String name;

  MChapterSimple({
    this.id,
    this.name,
  });

  factory MChapterSimple.fromJson(Map<String, dynamic> json) => MChapterSimple(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
      
}
