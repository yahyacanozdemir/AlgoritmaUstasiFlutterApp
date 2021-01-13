import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
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
  final VoidCallback onPressed;

  const AppButton(
      {Key key,
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
      this.paddingLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      decoration: BoxDecoration(
          color: bcgColor, borderRadius: BorderRadius.circular(radius)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
