
import 'package:app/model/mhome.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:rxdart/rxdart.dart';

class XStoreViewModel {
  final homeGroupSubj = BehaviorSubject<MHome>();

  final categorySubj = BehaviorSubject<List<String>>();

  Future<XResponse> fetchHome() async {
    final resp = await XApi.home();
    if (resp.isOK()) {
      homeGroupSubj.add(resp.data);
    } else {
      homeGroupSubj.addError(resp.error);
    }
    return resp;
  }

  Future<XResponse> fetchCategory() async {
    final resp = await XApi.categoryGroup();
    if (resp.isOK()) {
      categorySubj.add(resp.data);
    } else {
      categorySubj.addError(resp.error);
    }
    return resp;
  }
}
