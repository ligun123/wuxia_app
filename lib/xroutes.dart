import 'package:app/view/xbook_view.dart';
import 'package:app/view/xchapter_view.dart';
import "package:app/view/xsub_view.dart";
import "package:app/xbottom_controller.dart";
import "package:flutter/material.dart";

typedef Widget XWidgetBuilder(RouteSettings settings);

/// 集中管理route跳转
/// 如果新增了页面跳转，就在routerMap里面加入相应的页面生成方法
/// ```dart
/// "XSleepAddView": (RouteSettings settings) {
///   final args = settings.arguments as List;
///   return XSleepAddView(_argOf(args, 0), _argOf(args, 1));
/// },
/// ```
/// 使用XRoutes.push或者XRoutes.pushT来跳转页面
/// XRoutes.push接受字符串来指定页面
/// 注意arguments数组的顺序
/// ```dart
/// XRoutes.push(context, "XSleepAddView", arguments: [arg1, arg2]);
/// ```
/// XRoutes.pushT接受一个Type来指定页面，
/// 最终是把Type转化为字符串，通过Type.toString值来确定指定页面
/// ```dart
/// XRoutes.pushT(context, XSleepAddView, arguments: [arg1, arg2]);
/// ```
class XRoutes {
  /// 使用页面的类名作为key，修改页面类名这里也需要修改
  static final Map<String, XWidgetBuilder> routerMap = {
    "XBottomController": (RouteSettings settings) {
      return XBottomController();
    },
    "XSubView": (RouteSettings settings) {
      return XSubView(
        centerString: _argOf(settings.arguments, 0),
      );
    },
    "XBookView": (RouteSettings settings) {
      return XBookView(
        bookId: _argOf(settings.arguments, 0),
      );
    },
    "XChapterView": (RouteSettings settings) {
      return XChapterView();
    },
  };

  static Route<dynamic> routeGenerater(RouteSettings settings) {
    final builder = routerMap[settings.name];
    if (builder == null) {
      throw Exception("XME ERROR: Invalid route: ${settings.name}");
    }
    final widget = builder(settings);
    return MaterialPageRoute<Object>(
        builder: (ctx) {
          return widget;
        },
        settings: settings);
  }

  static Route<dynamic> unknownGenerater(RouteSettings settings) {
    final builder = routerMap["XBottomTabbar"];
    final widget = builder(settings);
    return MaterialPageRoute(
        builder: (ctx) {
          return widget;
        },
        settings: settings);
  }

  /// 通过页面的类名或者注册好的字符串key实现跳转
  /// eg:
  /// push(context, "XMsgReplyView")
  /// push(context, "abcdefg")
  static Future<T> push<T extends Object>(
      BuildContext context, String routeName,
      {List arguments}) {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }

  /// 通过传入页面的Type来实现跳转
  /// eg:
  /// pushT(context, XMsgReplyView);
  static Future<T> pushT<T extends Object>(BuildContext context, Type routeType,
      {List arguments}) {
    return push(context, routeType.toString(), arguments: arguments);
  }

  /// 防止参数数组越界访问
  static dynamic _argOf(List args, int index) {
    if (args == null) {
      return null;
    }
    return args.length > index ? args[index] : null;
  }
}
