/// 断网、新页面加载、toast提示效果

import "package:flutter/material.dart";

/// 断网效果，自动居中，背景透明
class XGlobalNeterrorView extends StatelessWidget {
  final VoidCallback onRefresh;
  final errorMsg;
  const XGlobalNeterrorView({Key key, this.errorMsg, this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icon_error.png",
            width: 160,
            height: 160,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            this.errorMsg ?? "Network Error",
            style: _XGlobalNeterrorViewStyle.textStyle(),
          ),
          SizedBox(
            height: 14,
          ),
          onRefresh == null
              ? Container()
              : GestureDetector(
                  onTap: onRefresh,
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Retry",
                        style: _XGlobalNeterrorViewStyle.buttonTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF8E99A0), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class _XGlobalNeterrorViewStyle {
  static TextStyle textStyle() {
    return TextStyle(fontSize: 17, color: Color(0xFF575F66));
  }

  static TextStyle subTextStyle() {
    return TextStyle(fontSize: 13, color: Color(0xFF8E99A0));
  }

  static TextStyle buttonTextStyle() {
    return TextStyle(fontSize: 12, color: Color(0xFF575F66));
  }
}
