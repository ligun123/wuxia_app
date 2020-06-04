import 'package:app/model/mbook.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:app/view/components/xbook_cell.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:app/xroutes.dart';
import 'package:flutter/material.dart';

class XCategoryView extends StatefulWidget {
  final String category;
  XCategoryView({Key key, this.category}) : super(key: key);

  _XCategoryViewState createState() => _XCategoryViewState();
}

class _XCategoryViewState extends State<XCategoryView> {
  XResponse<List<MBook>> _resp;
  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() {
    XApi.categoryList(category: widget.category).then((resp) {
      setState(() {
        _resp = resp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_resp == null) {
      return XGlobalNeterrorView(
        errorMsg: "Loading...",
      );
    } else if (_resp.error != null) {
      return XGlobalNeterrorView(
        onRefresh: refresh,
      );
    } else {
      return ListView(
        children: _resp.data
            .map((f) => Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 4,
                    bottom: 4,
                  ),
                  child: XBookCell(
                    bookModel: f,
                    onTap: bookCellTap,
                  ),
                ))
            .toList(),
      );
    }
  }

  void bookCellTap(MBook book) {
    XRoutes.push(context, "XBookView", arguments: [book.uid]);
  }
}
