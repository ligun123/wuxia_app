import 'package:app/model/mbook.dart';
import 'package:app/model/mchapter.dart';
import 'package:app/model/mcategory.dart';
import 'package:app/model/mhome.dart';
import 'package:app/utils/xrequest.dart';
import 'package:app/utils/xresponse.dart';

class XApi {
  /**
   * 查book详情
   */
  static Future<XResponse<MBook>> book({String bid}) {
    final req = XRequest(
        method: XRequestMethod.GET, path: "/book/v1", query: {"id": bid});
    return req.send<MBook>((json) {
      return MBook.fromJson(json);
    });
  }

  static Future<XResponse<List<MBook>>> bookMaylike({String bid}) {
    final req = XRequest(
        method: XRequestMethod.GET, path: "/book/maylike", query: {"id": bid});
    return req.send<List<MBook>>((json) {
      return (json as List).map<MBook>((f) {
        return MBook.fromJson(f);
      }).toList();
    });
  }

  /**
   * 查chapter
   */
  static Future<XResponse<MChapter>> chapter({String cid}) {
    final req = XRequest(
        method: XRequestMethod.POST, path: "/chapter", body: {"id": cid});
    return req.send<MChapter>((json) {
      return MChapter.fromJson(json);
    });
  }

  static Future<XResponse<MChapter>> chapterNext({int index, String bookid}) {
    final req = XRequest(
      method: XRequestMethod.POST,
      path: "/chapter/next",
      body: {
        "cindex": index,
        "bookid": bookid,
      },
    );
    return req.send<MChapter>((json) {
      return MChapter.fromJson(json);
    });
  }

  static Future<XResponse<MChapter>> chapterLast({int index, String bookid}) {
    final req = XRequest(
      method: XRequestMethod.POST,
      path: "/chapter/next",
      body: {
        "cindex": index,
        "bookid": bookid,
      },
    );
    return req.send<MChapter>((json) {
      return MChapter.fromJson(json);
    });
  }

  static Future<XResponse<List<String>>> categoryGroup() {
    final req = XRequest(path: "/category/group");
    return req.send<List<String>>((json) {
      return (json as List).map((f) => f as String).toList();
    });
  }

  static Future<XResponse<List<MBook>>> categoryList({String category}) {
    final req = XRequest(
      path: "/category/list",
      query: {"category": category},
    );
    return req.send<List<MBook>>((json) {
      return (json as List)
          .map<MBook>(
            (f) => MBook.fromJson(f),
          )
          .toList();
    });
  }

  static Future<XResponse<MHome>> home() {
    final req = XRequest(path: "/home/v1");
    return req.send<MHome>((json) {
      final lm = (json as List).map((f) => f as Map<String, dynamic>).toList();
      return MHome.fromJson(lm);
    });
  }
}
