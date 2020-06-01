import 'package:app/model/mhome.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:app/view/components/xbook_group_view.dart';
import 'package:app/view/components/xcategory_banner.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import "package:flutter/material.dart";
import 'package:rxdart/subjects.dart';

class XStoreView extends StatefulWidget {
  XStoreView({Key key}) : super(key: key);

  _XStoreViewState createState() => _XStoreViewState();
}

class _XStoreViewState extends State<XStoreView> with AutomaticKeepAliveClientMixin {
  XStoreViewModel _viewModel;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _viewModel = XStoreViewModel();
    _viewModel.fetchHome();
    _viewModel.fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        child: StreamBuilder(
          stream: _viewModel.homeGroupSubj.stream,
          builder: (ctx, snap) {
            if (snap.hasError) {
              return XGlobalNeterrorView(
                onRefresh: _viewModel.fetchHome,
              );
            }
            if (snap.data == null) {
              return XGlobalNeterrorView(
                errorMsg: "Loading...",
              );
            }
            final data = snap.data as MHome;
            return ListView.builder(
              itemCount: data.bookGroup.length + 1,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return XCategoryBanner();
                } else {
                  final groupModel = data.bookGroup[index - 1];
                  return XBookGroupView(
                    groupModel: groupModel,
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}

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
