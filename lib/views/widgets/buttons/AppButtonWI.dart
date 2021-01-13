import 'package:flutter/material.dart';

class AppButtonWI extends StatelessWidget {
  final double witdh;
  final double height;
  final double radius;
  final Color bcgColor;
  final Color textColor;
  final String text;
  final double margin;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final double marginLeft;
  final double padding;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double paddingLeft;
  final Icon iconType;
  final Color iconColor;
  final double iconPadding;
  final VoidCallback onPressed;

  const AppButtonWI({Key key,
    this.witdh,
    this.height,
    this.radius,
    this.bcgColor,
    this.textColor,
    this.text,
    this.onPressed,
    this.margin,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.marginLeft,
    this.padding,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.paddingLeft,
    this.iconPadding,
    this.iconType,
    this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: bcgColor, borderRadius: BorderRadius.circular(radius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w800),
          )
          ,
          IconButton(icon: iconType,color: iconColor,disabledColor: iconColor,),
        ],
      ),
    );
  }
}
