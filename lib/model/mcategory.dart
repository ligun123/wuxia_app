import 'package:app/model/xmodel.dart';
import 'mbook.dart';

class MCategory extends XModel {
  List<MBook> fantasy;
  List<MBook> game;
  List<MBook> sci;
  List<MBook> girl;
  List<MBook> cosplay;

  MCategory({
    this.fantasy,
    this.game,
    this.sci,
    this.girl,
    this.cosplay,
  });

  factory MCategory.fromJson(Map<String, dynamic> json) => MCategory(
        fantasy:
            List<MBook>.from(json["fantasy"].map((x) => MBook.fromJson(x))),
        game: List<MBook>.from(json["game"].map((x) => MBook.fromJson(x))),
        sci: List<MBook>.from(json["sci"].map((x) => MBook.fromJson(x))),
        girl: List<MBook>.from(json["girl"].map((x) => MBook.fromJson(x))),
        cosplay:
            List<MBook>.from(json["cosplay"].map((x) => MBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fantasy": List<dynamic>.from(fantasy.map((x) => x.toJson())),
        "game": List<dynamic>.from(game.map((x) => x.toJson())),
        "sci": List<dynamic>.from(sci.map((x) => x.toJson())),
        "girl": List<dynamic>.from(girl.map((x) => x.toJson())),
        "cosplay": List<dynamic>.from(cosplay.map((x) => x.toJson())),
      };
}
