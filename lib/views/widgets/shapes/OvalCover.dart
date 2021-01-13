import 'package:flutter/material.dart';

class OvalCover extends StatelessWidget {
  final Color bcgrColor;
  final String bcgrUrl;

  const OvalCover({Key key, this.bcgrColor, this.bcgrUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: bcgrColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: 50),
          ),
          Align(
            heightFactor: 1.5,
            child: Image(image: AssetImage(bcgrUrl)),
          )
        ],
      ),
    );
  }
}
