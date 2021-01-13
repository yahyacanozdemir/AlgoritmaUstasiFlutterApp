import 'package:algoritma_ustasi/Methods/AlgorithmWorks.dart';
import 'package:algoritma_ustasi/Methods/CreateDatabase.dart';
import 'package:algoritma_ustasi/models/Algorithm.dart';
import 'package:algoritma_ustasi/utils/AppColors.dart';
import 'package:algoritma_ustasi/views/widgets/buttons/AppButton.dart';
import 'package:algoritma_ustasi/views/widgets/buttons/AppButtonWI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class AlgorithmPage extends StatefulWidget {
  final String algorithmName;

  AlgorithmPage(
    this.algorithmName,
  );

  @override
  _AlgorithmPage createState() => _AlgorithmPage();
}

class _AlgorithmPage extends State<AlgorithmPage> with SingleTickerProviderStateMixin  {

  int alg_index;
  String alg_name;
  Color pageColor;
  Color coverColor;
  bool searchAlgorithm = false;
  bool binarySearchAlg = false;

  AlgorithmWorks algorithmWorks;
  LinearSearch linearSearch;
  BinarySearch binarySearch;
  InsertionSort insertionSort;
  MergeSort mergeSort;
  HeapSort heapSort;
  QuickSort quickSort;
  CountingSort countingSort;
  BucketSort bucketSort;
  RadixSort radixSort;

  List<Algorithm> tumAlgoritmalar = Database().tumAlgoritmalar;

  TabController kontrolcu;

  Iterable<RegExpMatch> matches;
  final ScrollController _scrollController = ScrollController();

  double _detayContainerYuksekligi = 185;
  double _errorContainerYuksekligi = 0;
  String _ErrorMasage = "Lütfen Tüm Alanları Eksiksiz ve Doğru Şekilde Doldurun";
  double _sonucContainerYuksekligi = 0;
  String gifName;


  TextEditingController _diziBoyutuController;
  TextEditingController _randomBitisController;
  TextEditingController _aranacakDegerController;
  String algoritmaSonucu = "Bu mesajı görüyorsanız geliştirici ile iletişime geçin.";
  String random_dizi = "";
  String sirali_dizi = "";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diziBoyutuController = TextEditingController(text: "");
    _randomBitisController = TextEditingController(text: "");
    _aranacakDegerController = TextEditingController(text: "");
    algorithmWorks = new AlgorithmWorks();

    switch (widget.algorithmName) {
      case "Linear Search":
        alg_index = 0;
        coverColor = AppColors.Dark_Sea_Green;
        alg_name = "LSe";
        kontrolcu = TabController(length: 2, vsync: this);
        gifName = "assets/gifs/lineersearch.gif";
        searchAlgorithm = true;
        binarySearchAlg = false;
        break;

      case "Binary Search":
        alg_index = 1;
        coverColor = AppColors.Dark_Coral;
        alg_name = "BSe";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/binarysearch.gif";
        searchAlgorithm = true;
        binarySearchAlg = true;
        break;

      case "Insertion Sort":
        alg_index = 2;
        coverColor = AppColors.Jacarta;
        alg_name = "ISo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/insertionsort.gif";
        break;

      case "Merge Sort":
        alg_index = 3;
        coverColor = AppColors.Garnet;
        alg_name = "MSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/mergesort.gif";
        break;

      case "Heap Sort":
        alg_index = 4;
        coverColor = AppColors.Soldier_Green;
        alg_name = "HSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/heapsort.gif";
        break;

      case "Quick Sort":
        alg_index = 5;
        coverColor = AppColors.Dark_Electric_Blue;
        alg_name = "QSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/quicksort.gif";
        break;

      case "Counting Sort":
        alg_index = 6;
        coverColor = AppColors.Light_Taupe;
        alg_name = "CSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/countingsort.gif";
        break;

      case "Bucket Sort":
        alg_index = 7;
        coverColor = AppColors.Oxley;
        alg_name = "BSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/bucketsort.gif";
        break;

      case "Radix Sort":
        alg_index = 8;
        coverColor = AppColors.Terra_Cotta;
        alg_name = "RSo";
        kontrolcu = TabController(length: 3, vsync: this);
        gifName = "assets/gifs/radixsort.gif";
        break;
    }
    ;

    pageColor = Colors.grey.shade100;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _diziBoyutuController.dispose();
    _randomBitisController.dispose();
    _aranacakDegerController.dispose();
    kontrolcu.dispose();
  }

  var _errorContainerKey;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,

        home: Scaffold(
          backgroundColor: pageColor,
          body: CustomScrollView(
            controller: _scrollController,
            primary: false,
            slivers: [
              SliverAppBar(
                excludeHeaderSemantics: true,
                primary: false,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                titleSpacing: 25,
                toolbarHeight: 85,
                elevation: 10,
                pinned: true,
                backgroundColor: coverColor,
                leading: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    margin: EdgeInsets.only(left: 0),
                    child: Text(
                      widget.algorithmName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  background: Container(
                    color: coverColor,
                    width: 350,
                    child: RotatedBox(
                      quarterTurns: 0,
                      child: Image.asset(
                        "assets/images/covervector.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildGifContainer(context, gifName),
                      buildDetayButton(),
                      buildDetayContainer(context),
                      buildAlgorithmIO(context),
                      buildSonucContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  AnimatedContainer buildGifContainer(BuildContext context, String gifName) {
    return AnimatedContainer (
        duration: Duration(milliseconds: 500),
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black, width: 2)),
        child: Image.asset(
          gifName,
          height: 140,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ));
  }
  AnimatedContainer buildDetayContainer(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width - 20,
      height: _detayContainerYuksekligi,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 200,
        child: ListView(
          children: [
            Text(
              tumAlgoritmalar[alg_index].algoritmaAdi,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w900,color:coverColor ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(tumAlgoritmalar[alg_index].algoritmaDetayi),
            Text(
              tumAlgoritmalar[alg_index].algoritmaAnalizi,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, ),
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
      ),
    );
  }
  AnimatedContainer buildSonucContainer(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width - 20,
      height: _sonucContainerYuksekligi,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBarView(controller: kontrolcu, children: [
        ListView(
          children: [
            Center(
              child: Container(
                child: Text(
                  algoritmaSonucu.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(right: 15, left: 15),
              ),
            ),
          ],
        ),
        ListView(
          children: [
            Container(
              child: Text(
                random_dizi,
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(right: 15, left: 15),
            ),
          ],
        ),
        if (!searchAlgorithm || binarySearchAlg)
          ListView(
            children: [
              Container(
                child: Text(
                  sirali_dizi,
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(right: 15, left: 15),
              ),
            ],
          ),
      ]),
    );
  }
  AnimatedContainer buildErrorArea(BuildContext context) {
    return AnimatedContainer(
      key: _errorContainerKey,
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      height: _errorContainerYuksekligi,
      padding: EdgeInsets.only(top: 1, right: 8, left: 8),
      child: Text(
        _ErrorMasage,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  Card buildAlgorithmIO(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Algoritmayı Çalıştırmak İçin\n Bu Bölümü Kullan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 10.0),
                  blurRadius: 150.0,
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(top: 30, bottom: 0),
              child: TextField(
                onSubmitted: (input) => focusAlgorithm(),
                onTap: () => focusAlgorithm(),
                onChanged: (String) => focusAlgorithm(),
                controller: _diziBoyutuController,
                maxLines: 1,
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Rastgele Oluşturulacak Dizi Boyutu",
                  hintText: "(En fazla 9999)",
                  labelStyle: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  filled: true,
                ),
              )),
          Text(
            "Rastgele Dizi Elemanları İçin",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 2 - 50,
              margin: EdgeInsets.only(bottom: 5),
              child: TextField(
                onSubmitted: (input) => focusAlgorithm(),
                onTap: () => focusAlgorithm(),
                onChanged: (String) => focusAlgorithm(),
                controller: _randomBitisController,
                maxLines: 1,
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Sayı Aralığı(Max)",
                  hintText: "Max Değer",
                  labelStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  filled: true,
                ),
              )),
          if (searchAlgorithm || binarySearchAlg)
            Container(
                width: MediaQuery.of(context).size.width / 2 - 100,
                child: TextField(
                  onSubmitted: (input) => focusAlgorithm(),
                  onTap: () => focusAlgorithm(),
                  onChanged: (String) => focusAlgorithm(),
                  controller: _aranacakDegerController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Aranacak Deger",
                    hintText: "Değer",
                    labelStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                )),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCalistirButton(),
                buildSonucTemizleButton(),
              ],
            ),
          ),
          buildErrorArea(context),
        ],
      ),
    );
  }

  BouncingWidget buildDetayButton() {
    String title = "Detayları Göster";
    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: 2.5,
      onPressed: () {
        setState(() {
          if (_detayContainerYuksekligi == 0) {
            _detayContainerYuksekligi = 185;
            title = "Detayları Gizle";
          } else {
            _detayContainerYuksekligi = 0;
            title = "Detayları Göster";
          }
        });
      },
      child: _detayContainerYuksekligi == 185
          ? AppButtonWI(
        witdh: 160,
        height: 40,
        marginTop: 5,
        padding: 2,
        bcgColor: Colors.white,
        radius: 20,
        text: "Detayları Gizle",
        iconType: Icon(Icons.arrow_circle_up_rounded),
        iconColor: Colors.black,
        iconPadding: 1,
      )
          : AppButtonWI(
        witdh: 160,
        height: 40,
        marginTop: 5,
        padding: 2,
        bcgColor: Colors.white,
        radius: 20,
        text: "Detayları Göster",
        iconType: Icon(Icons.arrow_circle_down_rounded),
        iconColor: Colors.black,
        iconPadding: 1,
      ),
    );
  }
  BouncingWidget buildCalistirButton() {
    return BouncingWidget(
        duration: Duration(milliseconds: 100),
        scaleFactor: 2.5,
        onPressed: () {
          setState(() {
            if (searchAlgorithm) {
              if (algorithmWorks.inputControlforSearch(
                  _diziBoyutuController.text,
                  _randomBitisController.text,
                  _aranacakDegerController.text)) {
                openSonucContainer();
              } else {
                closeSonucContainer();
                Scaffold();
                focusAlgorithm();
              }
            } else {
              if (algorithmWorks.inputControlforSort(
                _diziBoyutuController.text,
                _randomBitisController.text,
              )) {
                openSonucContainer();
              } else {
                closeSonucContainer();
                Scaffold();
                focusAlgorithm();
              }
            }

            goAlgorithmProcess();
          });
        },
        child: AppButton(
          witdh: 160,
          height: 40,
          margin: 10,
          padding: 11,
          bcgColor: Colors.greenAccent,
          radius: 20,
          text: "Çalıştır",
        ));
  }
  BouncingWidget buildSonucTemizleButton() {
    return BouncingWidget(
        duration: Duration(milliseconds: 100),
        scaleFactor: 2.5,
        onPressed: () {
          setState(() {
            if (alg_name == "LSe" || alg_name == "BSe") {
              _diziBoyutuController.text = "";
              _randomBitisController.text = "";
              _aranacakDegerController.text = "";
              _sonucContainerYuksekligi = 0;
            } else {
              _diziBoyutuController.text = "";
              _randomBitisController.text = "";
              _sonucContainerYuksekligi = 0;
            }
          });
        },
        child: AppButton(
          witdh: 160,
          height: 40,
          margin: 10,
          padding: 11,
          bcgColor: Colors.deepOrange,
          radius: 20,
          text: "Girişleri Temizle",
        ));
  }


  focusAlgorithm({String value}) {
    setState(() {
      if (_sonucContainerYuksekligi == 300) {
        _scrollController.animateTo(
            _scrollController.position.viewportDimension,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut);
      }
      if (_sonucContainerYuksekligi == 0) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      }
    });
  }
  openSonucContainer() {
    setState(() {
      if (_sonucContainerYuksekligi == 0) {
        _errorContainerYuksekligi = 0;
        _ErrorMasage = "";
        _sonucContainerYuksekligi = 350;
      }
    });
  }
  closeSonucContainer() {
    _ErrorMasage = "Lütfen Tüm Alanları Eksiksiz ve Doğru Şekilde Doldurun";
    _errorContainerYuksekligi = 30;
    _sonucContainerYuksekligi = 0;
  }
  goAlgorithmProcess() {
    switch (alg_name) {
      case "LSe":
        linearSearch = new LinearSearch(_diziBoyutuController.text,
            _randomBitisController.text, _aranacakDegerController.text);
        algoritmaSonucu = linearSearch.sonucOlustur();
        break;

      case "BSe":
        binarySearch = new BinarySearch(_diziBoyutuController.text,
            _randomBitisController.text, _aranacakDegerController.text);
        algoritmaSonucu = binarySearch.sonucOlustur();
        break;

      case "ISo":
        insertionSort = new InsertionSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = insertionSort.sonucOlustur();
        break;

      case "MSo":
        mergeSort = new MergeSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = mergeSort.sonucOlustur();
        break;

      case "HSo":
        heapSort = new HeapSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = heapSort.sonucOlustur();
        break;

    //Todo: Her şey doğru ama adım sayısını kontrol et
      case "QSo":
        quickSort = new QuickSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = quickSort.sonucOlustur();
        break;

      case "CSo":
      //Todo: Her şey doğru ama adım sayısını kontrol et
        countingSort = new CountingSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = countingSort.sonucOlustur();
        break;

      case "BSo":
        bucketSort = new BucketSort(
            _diziBoyutuController.text, _randomBitisController.text);
        algoritmaSonucu = bucketSort.sonucOlustur();
        break;

      case "RSo":
      //Todo: Her şey doğru ama adım sayısını kontrol et
        radixSort = new RadixSort(
            _diziBoyutuController.text, _randomBitisController.text);
        if (int.parse(_diziBoyutuController.text) >= 11 &&
            int.parse(_randomBitisController.text) >= 11) {
          algoritmaSonucu = radixSort.sonucOlustur();
        } else
          algoritmaSonucu =
          "Algoritma mantığı gereği lütfen iki alana da 11 ve üzeri sayılar giriniz.";
        break;
      default:
        algoritmaSonucu =
        "Bu mesajı görüyorsanız geliştirici ile iletişime geçin.";
        break;
    }
    splitPart();
  }
  splitPart() {
    var ayirici = algoritmaSonucu.split("*");
    algoritmaSonucu = ayirici[0];
    random_dizi = ayirici[1];
    if (!searchAlgorithm || binarySearchAlg) sirali_dizi = ayirici[2];
  }











}


