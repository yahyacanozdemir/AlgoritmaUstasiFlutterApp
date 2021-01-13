import 'package:algoritma_ustasi/utils/AppColors.dart';
import 'package:algoritma_ustasi/views/pageViews/MainPage.dart';
import 'package:algoritma_ustasi/views/pageViews/SplashPage.dart';
import 'package:flutter/material.dart';

void main()=> runApp(algoritma_ustasi());


class algoritma_ustasi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/' : (context) => SplashPage(),
        '/anasayfa' : (context) => MainPage(),
      },
      theme: ThemeData(
        backgroundColor: AppColors.White_Chocolate
      ),
    );
  }
}

