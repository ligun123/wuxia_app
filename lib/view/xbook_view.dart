import 'package:app/model/mbook.dart';
import 'package:app/utils/xapi.dart';
import 'package:app/utils/xglobal_inherit.dart';
import 'package:app/utils/xresponse.dart';
import 'package:app/view/components/xbook_detail_banner.dart';
import 'package:app/view/components/xbook_item.dart';
import 'package:app/view/components/xchapter_cell.dart';
import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:app/xroutes.dart';
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
    viewModel.fetchBookMaylike();
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
      bottomNavigationBar: _buildBottomBar(context),
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
                    onPressed: viewModel.fetchBookMaylike,
                  ),
                  height: 44,
                ),
              ),
              StreamBuilder(
                stream: viewModel.bookMaylikeSubj.stream,
                builder: (ctx, AsyncSnapshot<List<MBook>> snap) {
                  if (snap.hasError) {
                    return SliverToBoxAdapter(
                      child: XGlobalNeterrorView(
                        onRefresh: viewModel.fetchBookMaylike,
                      ),
                    );
                  }
                  if (snap.data == null) {
                    return SliverToBoxAdapter(
                      child: XGlobalNeterrorView(
                        errorMsg: "Loading...",
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                    ),
                    sliver: SliverGrid.count(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      children: snap.data
                          .map<Widget>(
                            (f) => XBookItem(
                              bookModel: f,
                              onTap: (book) {
                                XRoutes.pushReplacement(context, "XBookView",
                                    arguments: [book.uid]);
                              },
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
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
    if (book.chapters.length >= 10) {
      listChildren.add(
        GestureDetector(
          onTap: () {
            XRoutes.push(context, "XChapterListView", arguments: [
              book.id.toString(),
              book.name,
            ]);
          },
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.only(left: 16, right: 16),
            height: 32,
            alignment: Alignment.centerLeft,
            child: Text("More ..."),
          ),
        ),
      );
    }
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
                  style: theme.textTheme.subtitle2.copyWith(
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
      onTap: () {
        XRoutes.push(context, "XChapterView", arguments: [book.latestChapter]);
      },
      child: body,
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final hasBook = XGlobalInherited.of(context)
        .bookshelf
        .hasBook(MBook(uid: widget.bookId));
    return Container(
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.pinkAccent,
              textColor: Colors.white,
              onPressed: hasBook ? null : addToBookshelfTap,
              child: Text("Add To Bookshelf"),
            ),
          ),
          Expanded(
            child: FlatButton(
              textColor: Colors.pinkAccent,
              onPressed: readNowTap,
              child: Text("Read Now"),
            ),
          ),
        ],
      ),
    );
  }

  void addToBookshelfTap() async {
    final book = viewModel.bookSubj.value;
    setState(() {
      XGlobalInherited.of(context).bookshelf.add(book);
    });
  }

  void readNowTap() {
    final book = viewModel.bookSubj.value;
    XGlobalInherited.of(context).bookshelf.add(book);
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
