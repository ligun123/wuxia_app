import 'package:app/view/components/xbook_detail_banner.dart';
import 'package:app/view/components/xbook_item.dart';
import 'package:app/view/components/xchapter_cell.dart';
import 'package:flutter/material.dart';

class XBookView extends StatefulWidget {
  XBookView({Key key}) : super(key: key);

  _XBookViewState createState() => _XBookViewState();
}

class _XBookViewState extends State<XBookView> {
  @override
  Widget build(BuildContext context) {
    final listChildren = [
      XBookDetailBanner(),
      XBookIntro(),
      _buildChapterHeader(context),
    ];
    listChildren.addAll(_buildChapters(context));
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Name"),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FlatButton(
            child: Text("data"),
          ),
          FlatButton(
            child: Text("data"),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(listChildren),
          ),
          SliverToBoxAdapter(
            child: XSimpleSection(
              backgroundColor: Theme.of(context).hoverColor,
              leadingIcon: SizedBox(width: 12),
              leading: Text("Maybe you like"),
              trailing: FlatButton(
                child: Text("Refresh"),
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  //TODO: refresh
                },
              ),
              height: 44,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
            ),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              children: <Widget>[
                XBookItem(),
                XBookItem(),
                XBookItem(),
                XBookItem(),
                XBookItem(),
                XBookItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterHeader(BuildContext context) {
    final theme = Theme.of(context);
    final body = Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 48,
      color: Theme.of(context).hoverColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Updated at 2020-05-26",
                  style: theme.textTheme.subtitle.copyWith(
                    color: theme.accentColor,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Chapter1999asdasdasdasdasdasd",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.caption.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: () {},
      child: body,
    );
  }

  List<Widget> _buildChapters(BuildContext context) {
    return [
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
      XChapterCell(),
    ];
  }
}
