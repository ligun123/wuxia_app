import 'package:app/model/mbook.dart';
import 'package:app/model/mchapter.dart';
import 'package:app/model/mcategory.dart';
import 'package:app/utils/xrequest.dart';
import 'package:app/utils/xresponse.dart';

class XApi {
  /**
   * 查book详情
   */
  static Future<XResponse<MBook>> book({String bid}) {
    final req =
        XRequest(method: XRequestMethod.POST, path: "/book", body: {"id": bid});
    return req.send<MBook>((json) {
      return MBook.fromJson(json);
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

  static Future<XResponse<MCategory>> category() {
    final req =
        XRequest(path: "/category");
    return req.send<MCategory>((json) {
      return MCategory.fromJson(json);
    });
  }
}
