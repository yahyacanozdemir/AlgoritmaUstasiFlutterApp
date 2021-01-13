import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {

  final String algorithmName;
  final String bcgrUrl;
  final Color appBarColor;
  final Color titleColor;
  final Widget iconType;

  const AppBarView({Key key, this.algorithmName, this.bcgrUrl, this.appBarColor, this.titleColor, this.iconType}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      excludeHeaderSemantics: true,
      primary: false,
      expandedHeight: MediaQuery.of(context).size.height/2,
      titleSpacing: 25,
      toolbarHeight: 85,
      elevation: 10,
      pinned: true,
      backgroundColor: appBarColor,
      leading: Padding(
          padding: EdgeInsets.only(top: 30),
          child: IconButton(
            color: Colors.black,
            icon: iconType,
            onPressed: () {
              if(algorithmName!="Algoritma Ustası") //AlgorithmPagede mi kontrolü
                Navigator.of(context).pop();
              Scaffold.of(context).openDrawer();
            },
          )),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(left: 0),
          child: Text(
            algorithmName,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ),
        background: Container(
          color: appBarColor,
          width: 350,
          child: RotatedBox(
            quarterTurns: 0,
            child: Image.asset(bcgrUrl,fit: BoxFit.contain,),
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}

