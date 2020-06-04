import 'package:app/view/components/xglobal_loading_view.dart';
import 'package:flutter/material.dart';

class XCategoryBanner extends StatelessWidget {
  final List<String> categorys;
  const XCategoryBanner({Key key, this.categorys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categorys == null || categorys.length == 0) {
      return XGlobalNeterrorView();
    }
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: categorys
            .map(
              (f) => XCategoryItem(
                category: f,
              ),
            )
            .toList(),
      ),
    );
  }
}

class XCategoryItem extends StatelessWidget {
  final String category;
  final Map _imgMap = {
    "Fantasy": "assets/icon_fantasy.png",
    "Xianxia": "assets/icon_xianxia.png",
    "Game": "assets/icon_game.png",
    "Sci-fi": "assets/icon_sci-fi.png",
    "Historical": "assets/icon_historical.png",
    "女生频道": "assets/icon_girl.png",
    "Romantic": "assets/icon_romantic.png",
    "小说同人": "assets/icon_colleague.png",
  };
  XCategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(category);
    final body = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Theme.of(context).buttonColor),
      ),
      width: 93,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(_imgMap[category], color: Colors.black54,),
          Text(
            category,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: () {
        //TODO:跳转category列表
      },
      child: body,
    );
  }
}
