import 'package:app/model/mbook_group.dart';
import 'package:app/model/xmodel.dart';

class MHome extends XModel {
  List<MBookGroup> bookGroup;
  MHome({this.bookGroup});

  factory MHome.fromJson(List<Map<String, dynamic>> json) => MHome(
        bookGroup: List<MBookGroup>.from(
          json.map((x) => MBookGroup.fromJson(x)),
        ),
      );

  List<Map<String, dynamic>> toJson() =>
      bookGroup.map((b) => b.toJson()).toList();
}
