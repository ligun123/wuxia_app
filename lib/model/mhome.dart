import 'package:app/model/xmodel.dart';
import 'mbook.dart';

class MHome extends XModel {
  List<MBook> hot;
  List<MBook> newest;

  MHome({
    this.hot,
    this.newest,
  });

  factory MHome.fromJson(Map<String, dynamic> json) => MHome(
        hot: List<MBook>.from(json["hot"].map((x) => MBook.fromJson(x))),
        newest: List<MBook>.from(json["new"].map((x) => MBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hot": List<dynamic>.from(hot.map((x) => x.toJson())),
        "new": List<dynamic>.from(newest.map((x) => x.toJson())),
      };
}
