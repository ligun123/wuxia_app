import 'package:app/view/xhome_view.dart';
import 'package:app/view/xschool_view.dart';
import 'package:app/view/xsettings_view.dart';
import 'package:flutter/material.dart';

class XBottomController extends StatefulWidget {
  XBottomController({Key key}) : super(key: key);

  _XBottomControllerState createState() => _XBottomControllerState();
}

class _XBottomControllerState extends State<XBottomController> {
  final pageViews = <Widget>[];
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageViews.addAll([
      XHomeView(),
      XSchoolView(),
      XSettingsView(),
    ]);
    pageController = PageController(initialPage: pageIndex);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pageViews,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildItems(),
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
          pageController.jumpToPage(index);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _buildItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        title: Text('School'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ];
  }
}
