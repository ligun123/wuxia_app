import 'package:app/model/mbook.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xresponse.dart';
import 'package:app/view/components/xbook_detail_banner.dart';
import 'package:app/view/components/xbook_item.dart';
import 'package:app/view/components/xchapter_cell.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class XBookView extends StatefulWidget {
  final String bookId;
  XBookView({Key key, @required this.bookId}) : super(key: key);

  _XBookViewState createState() => _XBookViewState();
}

class _XBookViewState extends State<XBookView> {
  XBookViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = XBookViewModel(bookId: widget.bookId);
    viewModel.fetchBook();

    viewModel.fetchBookMaylike().then((resp) {
      print(resp.data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: viewModel.bookSubj.stream,
          builder: (ctx, AsyncSnapshot<MBook> snap) {
            return Text(snap.data?.name ?? "");
          },
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("data"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("data"),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: viewModel.bookSubj.stream,
        builder: (ctx, AsyncSnapshot<MBook> snap) {
          if (snap.hasError) {
            return XGlobalNeterrorView(
              onRefresh: viewModel.fetchBook,
            );
          }
          if (snap.data == null) {
            return XGlobalNeterrorView(
              errorMsg: "Loading...",
              onRefresh: null,
            );
          }

          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  _buildBookDetail(
                    context,
                    snap.data,
                  ),
                ),
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
          );
        },
      ),
    );
  }

  List<Widget> _buildBookDetail(BuildContext context, MBook book) {
    final listChildren = [
      XBookDetailBanner(book: book),
      XBookIntro(intro: book.intro),
      _buildLatestChapter(context, book: book),
    ];
    listChildren
        .addAll(book.chapters.map((c) => XChapterCell(chapter: c)).toList());
    return listChildren;
  }

  Widget _buildLatestChapter(BuildContext context, {MBook book}) {
    final date = DateTime.fromMillisecondsSinceEpoch(book.updateTime);
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
                  "Updated at ${date.month}/${date.day}/${date.year}",
                  style: theme.textTheme.subtitle.copyWith(
                    color: theme.accentColor,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.latestChapter.name,
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
}

class XBookViewModel {
  final String bookId;
  final bookSubj = BehaviorSubject<MBook>();
  final bookMaylikeSubj = BehaviorSubject<List<MBook>>();

  XBookViewModel({@required this.bookId});

  Future<XResponse> fetchBook() {
    return XApi.book(bid: bookId).then((resp) {
      if (resp.isOK()) {
        bookSubj.add(resp.data);
      } else {
        bookSubj.addError(resp.error);
      }
      return resp;
    });
  }

  Future<XResponse> fetchBookMaylike() {
    return XApi.bookMaylike(bid: this.bookId).then((resp) {
      if (resp.isOK()) {
        bookMaylikeSubj.add(resp.data);
      } else {
        bookMaylikeSubj.addError(resp.error);
      }
      return resp;
    });
  }
}
