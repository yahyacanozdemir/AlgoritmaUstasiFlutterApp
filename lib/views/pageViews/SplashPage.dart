import 'dart:async';
import 'package:algoritma_ustasi/utils/AppColors.dart';
import 'package:algoritma_ustasi/views/pageViews/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.Prussian_Blue,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/4,),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceIn,
                width: 250,
                height: 250,
                child: Lottie.asset("assets/lottie/finance_blue.json"),
              ),
              Expanded(
                child: WavyAnimatedTextKit(
                  textStyle:
                      TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  text: [
                    "Algoritma Ustası",
                  ],
                  isRepeatingAnimation: false,
                  speed: Duration(milliseconds: 100),
                ),
              ),
              Expanded(child: SizedBox(height: 200,)),
              Image.asset("assets/images/logo_dvby.png",width: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
