import 'package:algoritma_ustasi/models/Algorithm.dart';
import 'package:algoritma_ustasi/utils/Algorithms.dart';

class Database{

  static List<Algorithm> createDatabase() {
    List<Algorithm> algoritmalar =[];
    for(int i =0 ; i < Algorithms.ALGORITMA_ADLARI.length ; i++){
      String resim = 'assets/images/'+Algorithms.ALGORITMA_ADLARI[i]+".png";
      Algorithm eklenecekAlgoritma = Algorithm(Algorithms.ALGORITMA_ADLARI[i], Algorithms.ALGORITMA_ACIKLAMALARI[i], Algorithms.ALGORITMA_DETAYLARI[i], resim, Algorithms.ALGORITMA_ANALIZLERI[i]);
      algoritmalar.add(eklenecekAlgoritma);
    }
    return algoritmalar ;
  }

  List<Algorithm> tumAlgoritmalar = createDatabase();


}