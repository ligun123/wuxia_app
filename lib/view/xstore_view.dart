import 'package:app/model/mhome.dart';
import 'package:app/view/components/xbook_group_view.dart';
import 'package:app/view/components/xcategory_banner.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:app/view_model/xstore_view_model.dart';
import "package:flutter/material.dart";

class XStoreView extends StatefulWidget {
  final XStoreViewModel viewModel;
  XStoreView({Key key, this.viewModel}) : super(key: key);

  _XStoreViewState createState() => _XStoreViewState();
}

class _XStoreViewState extends State<XStoreView>
    with AutomaticKeepAliveClientMixin {
  

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        child: StreamBuilder(
          stream: widget.viewModel.homeGroupSubj.stream,
          builder: (ctx, snap) {
            if (snap.hasError) {
              return XGlobalNeterrorView(
                onRefresh: widget.viewModel.fetchHome,
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
                  return StreamBuilder(
                    stream: widget.viewModel.categorySubj.stream,
                    builder: (ctx, AsyncSnapshot<List<String>> snap) {
                      return XCategoryBanner(categorys: snap.data,);
                    },
                  );
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
