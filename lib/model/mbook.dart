import 'package:app/model/mchapter.dart';
import 'package:app/model/xmodel.dart';

class MBook extends XModel {
  int id;
  String uid;
  String name;
  String author;
  String spiderUrl;
  String category;
  int updateTime;
  String icon;
  String intro;
  int chapterCount;
  int readCount;
  int wordCount;
  List<MChapterSimple> chapters;
  MChapterSimple latestChapter;

  MBook({
    this.id,
    this.uid,
    this.name,
    this.author,
    this.spiderUrl,
    this.category,
    this.updateTime,
    this.icon,
    this.intro,
    this.chapterCount,
    this.readCount,
    this.wordCount,
    this.chapters,
    this.latestChapter,
  });

  factory MBook.fromJson(Map<String, dynamic> json) => MBook(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        author: json["author"],
        spiderUrl: json["spider_url"],
        category: json["category"],
        updateTime: json["update_time"],
        icon: json["icon"],
        intro: json["intro"],
        chapterCount: json["chapter_count"],
        readCount: json["read_count"],
        wordCount: json["word_count"],
        chapters: json["chapters"] == null
            ? null
            : List<MChapterSimple>.from(
                json["chapters"].map((x) => MChapterSimple.fromJson(x))),
        latestChapter: json["latestChapter"] == null
            ? null
            : MChapterSimple.fromJson(json["latestChapter"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "author": author,
        "spider_url": spiderUrl,
        "category": category,
        "update_time": updateTime,
        "icon": icon,
        "intro": intro,
        "chapter_count": chapterCount,
        "read_count": readCount,
        "word_count": wordCount,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
        "latestChapter": latestChapter.toJson(),
      };
}
