# Definisi Analisis Cluster
  Analisis cluster atau analisis kelompok merupakan teknik analisa data yang bertujuan untuk mengelompokan individu atau objek ke dalam beberapa kelompok yang memiliki sifat berbeda antar kelompok, sehingga individu atau objek yang terletak di dalam satu kelompok akan mempunyai sifat relatif homogen

# Proses Analisis Cluster 
  1. Menetapkan ukuran jarak antar data, mengukur kesamaan antara objek. Sesuai prinsip dasar cluster yang mengeelompokan objek yang mempunyai kemiripan, maka proses pertama adalah mengukur seberapa jauh ada kesamaan objek. Pengukuran jarak yang populer adalah metode Euclidean distance. Pada dasarnya, cara ini akan memasukan sebuah data ke dalam cluster tertentu dengan mengukur jarak data tersebut ke pusat cluster. 
  2. Melakukan proses standarisasi data jika diperlukan. 
  3. Melakukan pengklasteran, proses inti clustering adalah pengelompokan data, yang biasa dilakukan dengan dua metode yaitu: 
      1) Metode Hierarki: Metode ini memulai pengelompokan dengan dua atau lebih objek yang mempunyi kesaman paling dekat. Kemudian proses diteruskan ke objek lain yang mempunyai kedekatan kedua. Demikian seterusnya sehingga cluster akan membentuk semacam pohon dimana ada hierarki (tingkatan yang jelas) antara objek. Dendogram biasanya digunakan untuk membantu memperjelas proses hierarki tersebut.
      2) Metode Nonhierarki: Berbeda dengan metode hierarki, metode ini justru di mulai dengan menentukan terlebih dahulu jumlah cluster yang diinginkan. Setelah jumlah cluster diketahui, baru proses cluster dilakukan tanpa mengikuti proses hierarki. Metode ini juga disebut K-Means cluster. 
  4. Melakukan penanaman cluster-cluster yang terbentuk. 
  5. Melakukan validasi dan profiling cluster. 
