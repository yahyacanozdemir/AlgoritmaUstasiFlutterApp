import 'package:algoritma_ustasi/Methods/CreateDatabase.dart';
import 'package:algoritma_ustasi/models/Algorithm.dart';
import 'package:algoritma_ustasi/utils/AppColors.dart';
import 'package:algoritma_ustasi/views/widgets/cards/Algorithm_Card.dart';
import 'package:algoritma_ustasi/views/widgets/components/AppBarView.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:button_animations/button_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  String _title = "Algoritma Ustası";
  DrawerController drawerController;
  List<Algorithm> tumAlgoritmalar = Database().tumAlgoritmalar;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: AppColors.White_Chocolate,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            elevation: 20,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: AppColors.Prussian_Blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "Geliştirici Bilgileri",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                letterSpacing: 1,
                                wordSpacing: 2),textAlign: TextAlign.center,
                          ),
                          BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 2.5,
                            onPressed: () =>
                                _scaffoldKey.currentState.openEndDrawer(),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/pp_ls.jpg"),
                            radius: 55,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Yahya Can Özdemir",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 1,
                                wordSpacing: 2,),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: AnimatedButton(
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: () {
                                launchURL(
                                    "https://www.linkedin.com/in/yahyacanozdemir/");
                              },
                              type: null,
                              height: 45,
                              width: 45,
                              borderRadius: 22.5,
                              color: Color(0xFF49659F),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: AnimatedButton(
                              child: Icon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: () {
                                launchURL("https://github.com/yahyacanozdemir");
                              },
                              type: null,
                              height: 45,
                              width: 45,
                              borderRadius: 22.5,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: AnimatedButton(
                              child: Icon(
                                FontAwesomeIcons.mailBulk,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: () {
                                launch(emailLaunchUri.toString());
                              },
                              type: null,
                              height: 45,
                              width: 45,
                              borderRadius: 22.5,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0,bottom: 19),
                        child: AnimatedButton(onTap: ()=>_scaffoldKey.currentState.openEndDrawer() , child: Container(child: Text(
                          "Algoritma Ustası",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: 1,
                            wordSpacing: 2,),
                        ),)),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Uygulama Bilgileri",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: 1,
                            wordSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      Card(
                        color: Colors.grey.shade300,
                        elevation: 0,
                        shadowColor: AppColors.Prussian_Blue,
                        child: Column(
                          children: [
                            Text(
                              "Uyumluluk",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  letterSpacing: 1,
                                  wordSpacing: 2),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Text(
                                "Android & IOS",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.Prussian_Blue,
                                    letterSpacing: 1,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Text(
                                "Geliştirme Ortamı",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Text(
                                "Flutter & Dart",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.Prussian_Blue,
                                    letterSpacing: 1,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Text(
                                "Versiyon",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Text(
                                "1.0",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.Prussian_Blue,
                                    letterSpacing: 1,
                                    wordSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Card(
                        elevation: 10,
                        color: Colors.grey.shade300,
                        child: Text(
                          "Algoritma Ustası 2021 Tüm Hakları Saklıdır",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 1,
                              wordSpacing: 2),
                          textAlign: TextAlign.center,
                        ),
                      ),





                    ],
                  ),
                ),
              ],
            )),
        body: CustomScrollView(
          primary: false,
          slivers: [
            AppBarView(
              algorithmName: "Algoritma Ustası",
              appBarColor: Colors.white,
              iconType: Icon(Icons.menu),
              bcgrUrl: "assets/images/developer.png",
              titleColor: Colors.black,
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  CardlariOlustur(),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url Adresi Açılamadı.';
    }
  }

  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'yahyacanozdemir@gmail.com',
      queryParameters: {'subject': 'Algoritma Ustası Mobile App Hakkında'});

  Widget CardlariOlustur() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Algorithm_Card(
          name: "LinearSearch",
          coverColor: AppColors.Dark_Sea_Green,
          isLtr: true,
          algorithmNumber: 0,
        ),
        Algorithm_Card(
          name: "BinarySearch",
          coverColor: AppColors.Dark_Coral,
          isLtr: false,
          algorithmNumber: 1,
        ),
        Algorithm_Card(
          name: "InsertionSort",
          coverColor: AppColors.Jacarta,
          isLtr: true,
          algorithmNumber: 2,
        ),
        Algorithm_Card(
          name: "MergeSort",
          coverColor: AppColors.Garnet,
          isLtr: false,
          algorithmNumber: 3,
        ),
        Algorithm_Card(
          name: "HeapSort",
          coverColor: AppColors.Soldier_Green,
          isLtr: true,
          algorithmNumber: 4,
        ),
        Algorithm_Card(
          name: "QuickSort",
          coverColor: AppColors.Dark_Electric_Blue,
          isLtr: false,
          algorithmNumber: 5,
        ),
        Algorithm_Card(
          name: "CountingSort",
          coverColor: AppColors.Light_Taupe,
          isLtr: true,
          algorithmNumber: 6,
        ),
        Algorithm_Card(
          name: "BucketSort",
          coverColor: AppColors.Oxley,
          isLtr: false,
          algorithmNumber: 7,
        ),
        Algorithm_Card(
          name: "RadixSort",
          coverColor: AppColors.Terra_Cotta,
          isLtr: true,
          algorithmNumber: 8,
        ),
      ],
    );
  }
}
