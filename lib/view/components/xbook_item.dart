import "package:flutter/material.dart";

/**
 * simple of book
 */

class XBookItem extends StatelessWidget {
  XBookItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "assets/icon_unknown.jpg",
            width: 75,
            height: 100,
          ),
          Text(
            "The God eater asdasdasdasasdasdasdasdadsd",
            // style: theme.textTheme.subhead,
            maxLines: 3,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class XSimpleSection extends StatelessWidget {
  final Widget leadingIcon;
  final Widget leading;
  final Widget trailing;
  final Color backgroundColor;
  final double height;
  const XSimpleSection({
    Key key,
    this.leadingIcon,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (leadingIcon != null) {
      children.add(leadingIcon);
      children.add(SizedBox(width: 4));
    }
    children.add(leading);
    children.add(Spacer());
    children.add(trailing);
    return Container(
      height: height,
      color: backgroundColor,
      child: Row(
        children: children,
      ),
    );
  }
}
