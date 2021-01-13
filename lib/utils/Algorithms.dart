class Algorithms {

  static const String APP_NAME="Algoritma Ustası";

  static const List<String> ALGORITMA_ADLARI = [
    "LinearSearch",
    "BinarySearch",
    "InsertionSort",
    "MergeSort",
    "HeapSort",
    "QuickSort",
    "CountingSort",
    "BucketSort",
    "RadixSort",
  ];

  static const List<String> ALGORITMA_ACIKLAMALARI = [
    "Her elemana tek tek bakarak ilerleyen arama algoritmasıdır... \n\nKarmaşıklık : Θ(n)",
    "Sıralanmış diziyi ikiye bölerek ilerleyen arama algoritmasıdır... \n\nKarmaşıklık : Θ(log n)",
    "Veriyi bir önceki veriyle kıyaslayarak ilerleyen sıralama algoritmasıdır... \n\n Karmaşıklık : Θ(n^2)",
    "Veri setine böl ve fethet mantığı uygulayan sıralama algoritmasıdır...\n\nKarmaşıklık : Θ(nlogn)",
    "Diziden bir yığın ağacı oluşturarak çalışan sıralama algoritmasıdır... \n\nKarmaşıklık : Θ(nlogn)",
    "Seçilen bir pivot değerin kıyasıyla çalışan sıralama algoritmasıdır...\n\nKarmaşıklık : Θ(nlogn)",
    "Verilerin kaç tane olduğunu sayarak ilerleyen sıralama algoritmasıdır ...\n\nKarmaşıklık : Θ(n+k)",
    "Veri setini aralıklara bölerek ilerleyen sıralama algoritmasıdır... \n\nKarmaşıklık : Θ(n+k)",
    "Verileri tabanlarına göre ayırıp ilerleyen sıralama algoritmasıdır.\n\nKarmaşıklık : Θ(nk)",
  ];

  static const List<String> ALGORITMA_ANALIZLERI = [
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nBaşarısız Arama : O(n) \nEn İyi Durum : O(1) \nEn Kötü Durum : O(n) \nOrtalama : O(n)", // Linear
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nBaşarısız Arama : O(n) \nEn İyi Durum : O(1) \nEn Kötü Durum : O(log n) \nOrtalama : O(log n)", //binary
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nBaşarısız Arama : O(n) \nEn İyi Durum : O(n) \nEn Kötü Durum : O(n^2) \nOrtalama : O(n^2)", // insert
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n*log n) \nEn Kötü Durum : O(n*log n) \nOrtalama : O(n*log n)", // Merge
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n*log n) \nEn Kötü Durum : O(n*log n) \nOrtalama : O(n*log n)", // Heap
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n*log n) \nEn Kötü Durum : O(n^2) \nOrtalama : O(n*log n)", //Quick
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n+k) \nEn Kötü Durum : O(n+k) \nOrtalama : O(n+k)", //Counting
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n+k) \nEn Kötü Durum : O(n^2)  \nOrtalama : O(n+k)", //Bucket
    "\n\nAlgoritma Analizi (Zaman Karmaşıklığı)  \n\nEn İyi Durum : O(n*k) \nEn Kötü Durum : O(n*​k)  \nOrtalama : O(n*k)", //Radix
  ];

  static const List<String> ALGORITMA_DETAYLARI = [
    "Linear Search, verilen veri seti üzerinde her bir eleman ile aranan değeri karşılaştırarak arar."
    "Eğer aranan veri dizide bulunursa dizinin indeksini döner. Bulamazsa -1 gibi bir değer döner.\n\n"
    "Bu arama algoritması en basit ve çalışma zamanı olarak en kötü algoritmalardan biridir."
    "Çünkü en kötü ihtimal ile veri yapımız üzerinde tüm elemanları gezmesi gerekir.\n\n"
    "Bu algoritmanın zaman karmaşıklığı O(n)’dir. Burada n değeri inputu temsil ediyor."
     "Uzunluğu “n” olan bir dizi için en kötü durumda “n” kez çalışacak demek oluyor.",


    "Binary Search, sıralı(sorted) bir veri yapısı için kullanılır. Yani algoritmaya sadece aranan veri ile"
    "sıralı bir veri yapısı verebilirsiniz. Algoritma da size eğer aranan veri bulunursa bu verinin indeksini döner. "
    "Bunun için önce elimizdeki verinin sıralanması gerekir. Bunun için bir sorting algoritması kullanırsınız.\n\n"
    "Binary Search çalışma zamanı olarak Linear Search’den daha iyidir. Her iterasyonda arama uzayını yarıya indirmek "
    "üzere tasarlanmıştır. Öncelikle dizinin ortasındaki değeri aranan değer ile karşılaştırır. Eğer aranan değer "
    "ortanca değerden küçükse dizinin ikinci yarısını görmezden gelerek ilk yarısında aramaya devam eder. "
    "Daha sonra tekrar ilk yarının ortanca değeri ile karşılaştırır. Eğer aranan değer ortanca değerden küçükse sol yarı, "
    "büyükse sağ yarı ile devam eder. Bu şekilde aranan değeri bulana kadar sürer.\n\n Aranan değer ilk iterasyonda da bulunabilir"
    "son iterasyonda da. Ancak Linear Search’den farklı olarak her bir elemanı gezmediği için aranan değeri daha hızlı bulacaktır. ",


      "Insertion Sort, bilgisayar bilimlerinde kullanılan ve sıralı diziyi her adımda öge öge oluşturan bir sıralama algoritmasıdır. "
      "Insertion Sort Algoritması, düzensiz dizi elemanlarını tek tek ele alarak her birini dizinin sıralanmış kısmındaki uygun yerine "
      "yerleştirme esasına dayanır. Genelllikle günlük hayatımızda farketmeden kullandığımız bir çözüm yöntemidir. Küçük boyutlu dizileri "
      "sıralamada hızlı olsa da çok sayıda veriyi sıralarken Insertion Sort diğer sıralama yöntemlerine göre çok yavaş kalmaktadır.\n\n"
      "Algoritmada, ikinci elemandan başlayarak elemanın kendinden önceki elemanlarla karşılaştırılması suretiyle "
      "büyük elemanlar dizide sağa doğru kaydırılır. Böylelikle açılan uygun pozisyona o anda sıralanmakta olan eleman yerleştirilir. Yani, "
      "algoritmanın küçükten büyüğe sıralama yaptığı düşünülürse, sayı dizisinin ikinci elemanını kendisine anahtar eleman olarak seçer. "
      "Bu anahtar eleman bir önceki elemandan başlayıp, kendinden önceki tüm sayılarla, anahtar olarak seçilen sayıyı kıyaslar. "
      "Kendinden büyük olan her sayıyla yerleri değiştirir. Kendinden küçük sayıyla karşılaştığında yer değiştirme işlemi biter. "
      "Ardından dizinin son elemanına kadar anahtar sayı seçimi ve devamındaki tüm işlemler devam eder.",


      "Merge Sort (Birleştirme Sıralaması), diziyi ardışık olarak en küçük alt dizilerine kadar yarılayan sonra da onları sıraya koyarak bireştiren "
      "özyineli bir algoritmadır. Yarılama işlemi en büyük alt dizi en çok iki öğeli olana kadar sürer. Sonra Merge (Birleştirme) işlemiyle"
      "altdiziler ikişer ikişer bölünüş sırasıyla sıralı olarak bir üst dizide bireşir. Süreç sonunda en üstte sıralı diziye ulaşılır.\n\n"
      "Algoritmanın çalışması kavramsal olarak şöyledir:\n\n"
      "1.) Sıralı olmayan diziyi ortadan eşit olarak iki alt diziye ayırır.\n"
      "2.) Bu ayırma işlemi, alt diziler en çok iki elemanlı olana kadar devam eder.\n"
      "3.) Alt dizileri kendi içinde sıralar.\n"
      "4.) Sıralı iki alt diziyi tek bir sıralı dizi olacak şekilde birleştirir.",



        "Verinin hafızada sıralı tutulması için geliştirilen sıralama algoritmalarından (sorting algorithms) bir tanesidir. Yığınlama sıralaması,"
        " arka planda bir yığın ağacı(heap)  oluşturur ve bu ağacın en üstündeki sayıyı alarak sıralama işlemi yapar. Bu verilerin bir oluşumun  "
        "belirleyici alanları olduğunu düşünebiliriz. Yani örneğin vatandaşlık numarası veya öğrenci numarası gibi. Dolayısıyla örneğin "
        "öğrencilerin numaralarına göre sıralanması durumunda kullanılabilir.\n\n"
        "Algoritma adımları şu şekilde özetlenebilir:\n\n"
        "1.) Sayı grubundan bir ağaç oluşturulur.\n"
        "2.) Bu ağaç yaprak olmayan en son elemandan ilk(kök) elemana doğru heapify metoduyla yığınlaştırılır.\n"
        "3.) En üstte(kökte) duran yani en büyük olan değer alınarak sonuç dizisinin son elemanı yapılır.\n"
        "4.) Sonra geriye kalan sayılar tekrar yığınlaştırılır (heapify) ve bu işlem eleman kalmayana kadar yapılırsa sonuç dizisindeki veriler sıralanmış olarak elde edilir.\n"
        "5.) Bu sayı dizisi ilk başta verilen sayı dizisinin küçükten büyüğe sıralanmış halidir. Şayet büyükten küçüğe sıralanmak istenirse algoritmanın biraz değiştirilmesi gerekir.",



        "Verinin hafızada sıralı tutulması için geliştirilen sıralama algoritmalarından (sorting algorithms) bir tanesidir. Basitçe sıralanacak olan "
        "dizideki orta noktada (mean) bulunan bir sayıyı seçerek diğer bütün sayıları bu orta sayıdan büyük veya küçük diye sınıflayarak sıralama "
        "yapmayı hedeflemektedir. Bu açıdan bir parçala fethet (divide and conquere) yaklaşımıdır. Ayrıca bu seçilen orta noktaya eksen (pivot) "
        "adı da verilir çünkü bütün diğer sayılar bu sayının ekseninde sıralanacaktır.\n\n"
        "Hızlı sıralamanın algoritma karmaşıklığına bakıldığında O(nlogn) olarak bulunur çünkü üzerinde çalışılan dizi her adımda en fazla 2ye "
        "bölünmüştür (Big-O hesaplanırken en kötü ihtimalin hesaplandığını hatırlayınız) böylece sonuç dizisi olan 2şer elemanlı dizilere "
        "log2n adımda ulaşılabilir. Daha sonra her n eleman için sıralama yapıldığı ve her n eleman üzerinden geçildiği için bu değer çarpan "
        "olarak gelmekte ve sonuç nlog2n olarak bulunmaktadır.",



    "Verinin hafızada sıralı tutulması için geliştirilen sıralama algoritmalarından birisidir. Basitçe sıralanacak olan dizideki her sayının kaç "
     "tane olduğunu farklı bir dizide saklar ve daha sonra bu sayıların bulunduğu dizinin üzerinde bir işlemle sıralanmış olan diziyi elde eder\n\n"

    "Bir karar ağacı ile karşılaştırma modeli elde edilebilir:\n\n"
    "1.) Her n giriş boyutu için bir ağaç oluşturulur.\n"
    "2.) Ağaç tüm olası durumlarda karşılaştırmalar içerir.\n"
    "3.) Algoritmanın çalışma süresi = Alınan yolunun uzunluğu.\n"
    "4.) En kötü durum çalışma süresi = Ağacın yüksekliği.",



    "Kova Sıralaması (ya da sepet sıralaması), sıralanacak bir diziyi parçalara ayırarak sınırlı sayıdaki kovalara (ya da sepetlere) atan bir sıralama "
    "algoritmasıdır. Ayrışma işleminin ardından her kova kendi içinde ya farklı bir algoritma kullanılarak ya da kova sıralamasını özyinelemeli"
    "olarak çağırarak sıralanır.\n\n"
    "1.) Başlangıçta boş olan bir kova dizisi oluştur.\n"
    "2.) Asıl dizinin üzerinden geçerek her öğeyi ilgili aralığa denk gelen kovaya at.\n"
    "3.) Boş olmayan bütün kovaları sırala.\n"
    "4.) Boş olmayan kovalardaki bütün öğeleri yeniden diziye al",



    " Türkçe'de taban sıralaması , basamaklı sıralama , kök sıralaması veya hane sıralaması olarak geçen bu algoritmada sıralanacak olan veriler "
        "hanelerine göre sıralanır.En değersiz olan haneden en değerli haneye doğru sıralama işlemi yapılır."
    " Sıralanacak verilerin tamsayı olduğu durumlarda kullanılan bu algoritma işlenirken ilk olarak sıralanacak olan veri kümesindeki elemanların "
        "en büyük elemanının kaç basamaklı olduğu tespit edildikten sonra sayıların en değersiz olan basamağından"
    " itibaren incelenmeye başlanır ve yeni bir diziye yerleştirilir.Bu işlem dizinin en büyük elemanının basamak sayısı kadar tekrar edilir.\n\n"
    " Bu algoritmanın çalışma zamanı O(nk) ve yer karmaşıklığı O(n+k) olacaktır.Gayet iyi bir çalışma zamanına sahip olmasının nedeni bu algoritmanın"
        " karşılaştırmalı bir sıralama algoritması olmamasıdır.En büyük dezavantajı ise her basamak işlemi için yeni bir bellek alanı gerektirmesidir.",

  ];



}