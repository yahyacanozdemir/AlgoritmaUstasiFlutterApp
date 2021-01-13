class Algorithm {

  String _algoritmaAdi;
  String _algoritmaAciklamasi;
  String _algoritmaDetayi;
  String _algoritmaAnalizi;
  String _algoritmaResmi;
  

  Algorithm(this._algoritmaAdi, this._algoritmaAciklamasi, this._algoritmaDetayi,this._algoritmaResmi,
      this._algoritmaAnalizi);

  String get algoritmaAdi => _algoritmaAdi;

  set algoritmaAdi(String value) {
    _algoritmaAdi = value;
  }

  String get algoritmaAciklamasi => _algoritmaAciklamasi;

  set algoritmaAciklamasi(String value) {
    _algoritmaAciklamasi = value;
  }

  String get algoritmaDetayi => _algoritmaDetayi;

  set algoritmaDetayi(String value) {
    _algoritmaDetayi = value;
  }

  String get algoritmaAnalizi => _algoritmaAnalizi;

  set algoritmaAnalizi(String value) {
    _algoritmaAnalizi = value;
  }

  String get algoritmaResmi => _algoritmaResmi;

  set algoritmaResmi(String value) {
    _algoritmaResmi = value;
  }







}