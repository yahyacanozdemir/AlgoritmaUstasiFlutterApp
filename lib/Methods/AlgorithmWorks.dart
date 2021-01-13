import 'dart:math';
import 'package:algoritma_ustasi/views/pageViews/AlgorithmPage.dart';

class AlgorithmWorks {
  bool inputControlforSearch(
      String diziBoyutu, String randomBitis, String aranacakDeger) {
    if (diziBoyutu == "") return false;
    if (randomBitis == "") return false;
    if (aranacakDeger != null && aranacakDeger == "") return false;
    return true;
  }

  bool inputControlforSort(String diziBoyutu, String randomBitis) {
    if (diziBoyutu == "") return false;
    if (randomBitis == "") return false;

    return true;
  }
}

class DiziOlustur {
  String diziBoyutu;
  String randomBitis;

  DiziOlustur(this.diziBoyutu, this.randomBitis);

  diziOlustur() {
    List<int> sayilar = List(int.parse(diziBoyutu));
    Random rnd = new Random();
    for (int i = 0; i < sayilar.length; i++) {
      sayilar[i] = rnd.nextInt(int.parse(randomBitis)+1);
    }
    return sayilar;
  }
}

class LinearSearch {
  String diziBoyutu;
  String randomBitis;
  String aranacakDeger;

  LinearSearch(this.diziBoyutu, this.randomBitis, this.aranacakDeger);

  AlgorithmPage algorithmPage;

  String sonucOlustur() {


    List<int> linearDizisi = DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int aranan = int.parse(aranacakDeger);
    int location;
    bool bulundu = false;
    String sonuc;
    int adimSayisi = 0;


    var baslangic = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < linearDizisi.length; i++) {
      adimSayisi = adimSayisi + 1;
      if (linearDizisi[i] == aranan) {
        bulundu = true;
        location = i;
        sonuc =
            "Aranan değer rastegele oluşturulan dizinin $location . indexinde bulunuyor.\n\n";
        break;
      }
      if (!bulundu) {
        sonuc = "Aranan değer rastgele oluşturulan dizide bulunmuyor\n\n";
      }
    }

    var bitis = DateTime.now().millisecondsSinceEpoch;

    var zaman = ((bitis-baslangic)/1000);


    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Linear Search algoritmasına ait süredir.\n-------------------*";

    return sonuc + adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        linearDizisi.toString() ;
  }
}

class BinarySearch {
  String diziBoyutu;
  String randomBitis;
  String aranacakDeger;

  BinarySearch(this.diziBoyutu, this.randomBitis, this.aranacakDeger);

  String sonucOlustur() {
    List<int> binaryDizisi = DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int aranan = int.parse(aranacakDeger);
    int n = binaryDizisi.length;
    int location;
    bool bulundu = false;
    String sonuc;
    int ustIndex = binaryDizisi.length - 1;
    int altIndex = 0;
    int orta;
    int adimSayisi = 0;
    List<int> yeniDizi = new List();

    yeniDizi.addAll(binaryDizisi);


    yeniDizi.sort();

    var baslangic = DateTime.now().millisecondsSinceEpoch;

    while (ustIndex >= altIndex && !bulundu) {
      adimSayisi = adimSayisi + 1;
      orta = ((ustIndex + altIndex) / 2).toInt();
      if (aranan == yeniDizi[orta]) {
        bulundu = true;
        location = orta + 1;
        sonuc =
            "Aranan değer rastegele oluşturulan dizinin $orta . indexinde bulunuyor.\n\n";
      } else if (aranan <= yeniDizi[orta]) {
        ustIndex = orta - 1;
      } else {
        altIndex = orta + 1;
      }
    }

    if (!bulundu) {
      sonuc = "Aranan değer rastgele oluşturulan dizide bulunmuyor\n\n";
    }

    var bitis = DateTime.now().millisecondsSinceEpoch;

    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Binary Search algoritmasına ait süredir.\n-------------------*";


    return sonuc + adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        binaryDizisi.toString()+
        "*"+
        "Random Dizinin Sıralı Hali -> " +
        yeniDizi.toString();
  }
}

class InsertionSort {
  String diziBoyutu;
  String randomBitis;

  InsertionSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  String sonucOlustur() {
    List<int> insertionDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();

    int n = insertionDizisi_ilk.length;
    int i = 0, j = 0;
    int anahtar = 0;
    int adimSayisi = 0;
    List<int> insertionDizisi_son = new List();

    insertionDizisi_son.addAll(insertionDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;
    for (j = 1; j < n; j++) {
      adimSayisi = adimSayisi + 1;
      anahtar = insertionDizisi_son[j];
      i = j - 1;
      while ((i >= 0) && (insertionDizisi_son[i] > anahtar)) {
        adimSayisi = adimSayisi + 1;
        insertionDizisi_son[i + 1] = insertionDizisi_son[i];
        i = i - 1;
      }
      insertionDizisi_son[i + 1] = anahtar;
    }

    var bitis = DateTime.now().millisecondsSinceEpoch;

    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Insertion Sort algoritmasına ait süredir.\n-------------------*";


    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        insertionDizisi_ilk.toString() +
        "*" +
        " Insertion Sort ile sıralanmış dizi -> " +
        insertionDizisi_son.toString();
  }
}

class MergeSort {
  String diziBoyutu;
  String randomBitis;

  MergeSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> mergeDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int n = mergeDizisi_ilk.length;
    List<int> mergeDizisi_son = new List();

    mergeDizisi_son.addAll(mergeDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;
    mergeDizisi_son = mergeSort(mergeDizisi_son, 0, n - 1);

    var bitis = DateTime.now().millisecondsSinceEpoch;

    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Merge Sort algoritmasına ait süredir.\n-------------------*";



    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        mergeDizisi_ilk.toString() +
        "*" +
        " Merge Sort ile sıralanmış dizi -> " +
        mergeDizisi_son.toString();
  }

  List<int> mergeSort(List list, int leftIndex, int rightIndex) {
    adimSayisi += 1;
    if (leftIndex < rightIndex) {
      int middleIndex = (rightIndex + leftIndex) ~/ 2;
      mergeSort(list, leftIndex, middleIndex);
      mergeSort(list, middleIndex + 1, rightIndex);
      merge(list, leftIndex, middleIndex, rightIndex);
    }
    return list;
  }

  void merge(List list, int leftIndex, int middleIndex, int rightIndex) {
    adimSayisi=adimSayisi+1;
    int leftSize = middleIndex - leftIndex + 1;
    int rightSize = rightIndex - middleIndex;

    List leftList = new List(leftSize);
    List rightList = new List(rightSize);

    for (int i = 0; i < leftSize; i++) {
      leftList[i] = list[leftIndex + i];
    }
      for (int j = 0; j < rightSize; j++) {
        rightList[j] = list[middleIndex + j + 1];
      }
    int i = 0, j = 0;
    int k = leftIndex;

    while (i < leftSize && j < rightSize) {
      if (leftList[i] <= rightList[j]) {
        list[k] = leftList[i];
        i++;
      } else {
        list[k] = rightList[j];
        j++;
      }
      k++;
    }

    while (i < leftSize) {
      list[k] = leftList[i];
      i++;
      k++;
    }

    while (j < rightSize) {
      list[k] = rightList[j];
      j++;
      k++;
    }
  }
}

class HeapSort {
  String diziBoyutu;
  String randomBitis;

  HeapSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> heapDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    List<int> heapDizisi_son = new List();
    heapDizisi_son.addAll(heapDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;

    heapDizisi_son = heapSort(heapDizisi_son);

    var bitis = DateTime.now().millisecondsSinceEpoch;
    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Heap Sort algoritmasına ait süredir.\n-------------------*";

    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        heapDizisi_ilk.toString() +
        "*" +
        " Heap Sort ile sıralanmış dizi -> " +
        heapDizisi_son.toString();
  }

  List<int> heapSort(List list) {
    int n = list.length;

    for (int i = (n ~/ 2); i >= 0; i--) {
      adimSayisi += 1;
      heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      adimSayisi += 1;
      swap(list, i);
      heapify(list, i, 0);
    }
    return list;
  }

  void heapify(List list, int n, int i) {

    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapify(list, n, largest);
    }
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }
}

class QuickSort {

  String diziBoyutu;
  String randomBitis;

  QuickSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> quickDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int n = quickDizisi_ilk.length;
    List<int> quickDizisi_son = new List();
    quickDizisi_son.addAll(quickDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;

    quickDizisi_son = quickSort(quickDizisi_son, 0, quickDizisi_son.length - 1);

    var bitis = DateTime.now().millisecondsSinceEpoch;
    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Quick Sort algoritmasına ait süredir.\n-------------------*";

    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        quickDizisi_ilk.toString() +
        "*" +
        " Quick Sort ile sıralanmış dizi -> " +
        quickDizisi_son.toString();
  }

  List<int> quickSort(List<int> a, int low, int high)
  {
    adimSayisi+=1;
    if (low < high)
    {
      int pi = partition(a, low, high);
      quickSort(a, low, pi - 1);
      quickSort(a, pi + 1, high);
    }
    return a ;
  }


  int partition(List<int> list, int low, int high)
  {
    int pivot = list[low];
    int i = high;
    int temp;
    for (int j = high; j > low; j--)
    {
      adimSayisi+=1;
      if (list[j] > pivot)
      {
        temp = list[j];
        list[j] = list[i];
        list[i] = temp;
        i--;
      }
    }
    list[low] = list[i];
    list[i] = pivot;
    return i;
  }

}

class CountingSort {
  String diziBoyutu;
  String randomBitis;

  CountingSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> countingDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int n = countingDizisi_ilk.length;
    List<int> countingkDizisi_son = new List();
    countingkDizisi_son.addAll(countingDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;

    countingkDizisi_son = countingSort(countingkDizisi_son, n);

    var bitis = DateTime.now().millisecondsSinceEpoch;
    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Counting Sort algoritmasına ait süredir.\n-------------------*";

    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        countingDizisi_ilk.toString() +
        "*" +
        " Counting Sort ile sıralanmış dizi -> " +
        countingkDizisi_son.toString();
  }

  List<int> countingSort(List sayilar, int uzunluk) {
    int size1 = uzunluk + 1;
    List<int> sonDizi = new List(size1);

    adimSayisi += 1;
    int enbuyuk = sayilar[0];

    for (int i = 1; i < uzunluk; i++) {
      if (sayilar[i] > enbuyuk) {
        enbuyuk = sayilar[i];
        adimSayisi += 1;
      }
    }

    int size2 = enbuyuk + 1;
    List<int> countDizisi = new List(size2);

    for (int i = 0; i < enbuyuk + 1; ++i) {
      adimSayisi += 1;
      countDizisi[i] = 0;
    }

    for (int i = 0; i < uzunluk; i++) {
      adimSayisi += 1;
      countDizisi[sayilar[i]]++;
    }

    for (int i = 1; i <= enbuyuk; i++) {
      adimSayisi += 1;
      countDizisi[i] += countDizisi[i - 1];
    }

    for (int i = uzunluk - 1; i >= 0; i--) {
      adimSayisi += 1;
      sonDizi[countDizisi[sayilar[i]] - 1] = sayilar[i];
      countDizisi[sayilar[i]]--;
    }

    for (int i = 0; i < uzunluk; i++) {
      adimSayisi += 1;
      sayilar[i] = sonDizi[i];
    }

    return sayilar;
  }
}

class BucketSort {
  String diziBoyutu;
  String randomBitis;

  BucketSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> bucketDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int n = bucketDizisi_ilk.length;
    List<int> bucketkDizisi_son = new List();
    bucketkDizisi_son.addAll(bucketDizisi_ilk);

    var baslangic = DateTime.now().millisecondsSinceEpoch;

     bucketkDizisi_son = bucketSort(bucketkDizisi_son);

    var bitis = DateTime.now().millisecondsSinceEpoch;
    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Bucket Sort algoritmasına ait süredir.\n-------------------*";


    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        bucketDizisi_ilk.toString() +
        "*" +
        " Bucket Sort ile sıralanmış dizi -> " +
        bucketkDizisi_son.toString();
  }


  List<int> bucketSort(List list) {
    List<int> resultList = new List(list.length);
    adimSayisi+=1;

    int max = list[0];
    for (int i = 1; i < list.length; i++) {
      adimSayisi+=1;
      if (max < list[i]) {
        max = list[i];
      }
    }
    List bucketList = new List.filled(max + 1, 0);
    for (int i = 0; i < list.length; i++) {
      adimSayisi+=1;
      bucketList[list[i]]++;
    }
    int outPos = 0;
    for (int i = 0; i < bucketList.length; i++) {
      adimSayisi+=1;
      for (int j = 0; j < bucketList[i]; j++) {
        resultList[outPos++] = i;
      }
    }

    return resultList;
  }


}

class RadixSort {
  String diziBoyutu;
  String randomBitis;

  RadixSort(
    this.diziBoyutu,
    this.randomBitis,
  );

  int adimSayisi = 0;

  String sonucOlustur() {
    List<int> radixDizisi_ilk =
        DiziOlustur(diziBoyutu, randomBitis).diziOlustur();
    int n = radixDizisi_ilk.length;
    List<int> radixDizisi_son = new List();
    radixDizisi_son.addAll(radixDizisi_ilk);


    var baslangic = DateTime.now().millisecondsSinceEpoch;

     radixDizisi_son = radixSort(radixDizisi_son, n);

    var bitis = DateTime.now().millisecondsSinceEpoch;
    var zaman = ((bitis-baslangic)/1000);

    String adimIstatistik="-------------------\nToplam Yapılan İşlem Sayısı -> " + adimSayisi.toString() + "\n-------------------\n\n";
    String bilgilendirme= "-------------------\nAlgoritmanın başlangıç ve bitiş anındaki veri setlerini görmek için ekranı kaydırabilirsiniz -> \n-------------------";
    String zamanIstatistik = "\n\n-------------------\n Geçen Zaman : ${zaman} saniye \n------------------- \n\n";
    String uyari="-------------------\nUyarı : Bu süreye random dizinin oluşturulması ve sonuçların ekrana gelmesi dahil edilmemiştir.Yukarda yazan süre yalnızca Radix Sort algoritmasına ait süredir.\n-------------------*";

    return adimIstatistik+bilgilendirme+zamanIstatistik+uyari+
        "Rastgele Oluşturulan dizi -> " +
        radixDizisi_ilk.toString() +
        "*" +
        " Radix Sort ile sıralanmış dizi -> " +
        radixDizisi_son.toString();
  }

  List radixSort(List sayilar, int uzunluk) {

  int enbuyuk = largest(sayilar, uzunluk);

  for (int konum = 1; enbuyuk / konum > 0; konum *= 10) {
    adimSayisi+=1;
    sayilar = countingSort(sayilar, uzunluk, konum);
  }
  return sayilar;
  }

  List countingSort(List sayilar, int uzunluk, int konum) {

    List<int> sonDizi = new List(uzunluk + 1);
    int enbuyuk = sayilar[0];

    for (int i = 1; i < uzunluk; i++) {
      adimSayisi+=1;
      if (sayilar[i] > enbuyuk) enbuyuk = sayilar[i];
    }

    List<int> countDizisi = new List(enbuyuk);

    for (int i = 0; i < enbuyuk; ++i) {
      adimSayisi+=1;
      countDizisi[i] = 0;
    }
    for (int i = 0; i < uzunluk; i++){
      adimSayisi+=1;
      int deger =((sayilar[i] / konum) % 10).toInt() ;
      countDizisi[deger]++;
    }
    for (int i = 1; i < 10; i++) {
      adimSayisi+=1;
      countDizisi[i] += countDizisi[i - 1];
    }
    for (int i = uzunluk - 1; i >= 0; i--) {
      adimSayisi+=1;
      int deger = (((sayilar[i] / konum) % 10)).toInt();
      sonDizi[countDizisi[deger]-1] = sayilar[i];
      int deger2= ((sayilar[i] / konum) % 10).toInt();
      countDizisi[deger2]--;
    }
    for (int i = 0; i < uzunluk; i++) {
      adimSayisi+=1;
      sayilar[i] = sonDizi[i];
    }
      return sayilar;
    }

  int largest(List sayilar, int uzunluk) {
    int enbuyuk = sayilar[0];
    for (int i = 1; i < uzunluk; i++)
      if (sayilar[i] > enbuyuk) enbuyuk = sayilar[i];
    return enbuyuk;
  }

  }



