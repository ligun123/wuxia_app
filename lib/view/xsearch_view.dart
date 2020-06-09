import 'package:flutter/material.dart';

import '../model/mbook.dart';
import 'components/xbook_cell.dart';

class XSearchView extends StatefulWidget {
  @override
  _XSearchViewState createState() => _XSearchViewState();
}

class _XSearchViewState extends State<XSearchView> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  final searchResults = <MBook>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildSearchBar(context),
          ListView.builder(
            shrinkWrap: true,
            itemCount: searchResults.length,
            itemBuilder: (ctx, index) {
              return XBookCell(
                bookModel: searchResults[index],
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      height: 48,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 4),
            Icon(Icons.search),
            SizedBox(width: 4),
            Expanded(
              child: TextField(
                onSubmitted: searchSubmit,
                controller: textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchSubmit(String str) {}
}
