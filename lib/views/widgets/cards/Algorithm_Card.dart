import 'package:algoritma_ustasi/Methods/CreateDatabase.dart';
import 'package:algoritma_ustasi/models/Algorithm.dart';
import 'package:algoritma_ustasi/utils/AppColors.dart';
import 'package:algoritma_ustasi/views/pageViews/AlgorithmPage.dart';
import 'package:algoritma_ustasi/views/widgets/buttons/AppButton.dart';
import 'package:algoritma_ustasi/views/widgets/shapes/OvalCover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class Algorithm_Card extends StatefulWidget {
  final String name;
  final Color coverColor;
  final bool isLtr;
  final int algorithmNumber;

  const Algorithm_Card({Key key, this.name, this.coverColor, this.isLtr, this.algorithmNumber})
      : super(key: key);

  @override
  _Algorithm_CardState createState() => _Algorithm_CardState();
}

class _Algorithm_CardState extends State<Algorithm_Card> {
  double deger =
      0; //soldan sağa doğru olan ActionsAreanın border radiusunu ayarlar
  double deger2 =
      0; //sağdan sola doğru olan ActionsAreanın border radiusunu ayarlar

  List<Algorithm> tumAlgoritmalar = Database().tumAlgoritmalar;

  String algName="";
  bool rightVal=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLtr) return buildLtrContainer(widget.algorithmNumber);
    if (!widget.isLtr) return buildRtlContainer(widget.algorithmNumber);
  }

  GestureDetector buildLtrContainer(int algorithm_number) {
    setState(() {
      deger = 1;
    });
    return GestureDetector(
      onTap: ()=>changePage() ,
      child: Container(
          height: 240,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
                OvalCover(
                      bcgrColor: widget.coverColor,
                      bcgrUrl: tumAlgoritmalar[algorithm_number].algoritmaResmi,
                    ),
              buildActionsArea(
                  tumAlgoritmalar[algorithm_number].algoritmaAdi,
                  tumAlgoritmalar[algorithm_number].algoritmaAciklamasi),
            ],
          )),
    );
  }
  GestureDetector buildRtlContainer(int algorithm_number) {
    setState(() {
      deger2 = 1;
    });
    return GestureDetector(
      onTap: ()=>changePage(),
      child: Container(
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            buildActionsArea(
                tumAlgoritmalar[algorithm_number].algoritmaAdi,
                tumAlgoritmalar[algorithm_number].algoritmaAciklamasi),
            widget.name == "BinarySearch"
                ? OvalCover(
                    bcgrColor: widget.coverColor,
                    bcgrUrl: tumAlgoritmalar[algorithm_number].algoritmaResmi)
                : OvalCover(
                    bcgrColor: widget.coverColor,
                    bcgrUrl: tumAlgoritmalar[algorithm_number].algoritmaResmi,
                  ),
          ],
        ),
      ),
    );
  }
  Expanded buildActionsArea(String baslik, String aciklama) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 70, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.Pearl,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20 * deger),
            bottomRight: Radius.circular(20 * deger),
            topLeft: Radius.circular(20 * deger2),
            bottomLeft: Radius.circular(20 * deger2)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              baslik,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 1.0, bottom: 1, left: 1, right: 1),
            child: Text(
              aciklama,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: BouncingWidget(
              duration: Duration(milliseconds: 10),
              scaleFactor: 2.5,
              onPressed: () {
                changePage();
              },
              child: AppButton(
                witdh: 70,
                height: 40,
                marginTop: 20,
                padding: 12,
                text: "Aç",
                bcgColor: Colors.black,
                radius: 50,
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    ));
  }
  Route _createRoute(pageName, {bool right}) {

    if(right){
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AlgorithmPage(pageName),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }
    else{
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AlgorithmPage(pageName),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

  }
  void changePage(){

    switch (widget.name) {
      case "LinearSearch":
        algName="Linear Search";
        break;

      case "BinarySearch":
        algName="Binary Search";
        rightVal=true;
        break;

      case "InsertionSort":
        algName="Insertion Sort";
        break;

      case "MergeSort":
        algName="Merge Sort";
        rightVal=true;
        break;

      case "HeapSort":
        algName="Heap Sort";
        break;

      case "QuickSort":
        algName="Quick Sort";
        rightVal=true;
        break;

      case "CountingSort":
        algName="Counting Sort";
        break;

      case "BucketSort":
        algName="Bucket Sort";
        rightVal=true;
        break;

      case "RadixSort":
        algName="Radix Sort";
        break;

      default:
        print("Loglama Bölgesi");
    }

    Navigator.of(context).push(_createRoute(algName,right:rightVal));
  }


}
