import 'package:intl/intl.dart';

// =====================================================
// FORMAT RUPIAH
// =====================================================

final formatRupiah = NumberFormat('#,##0', 'id_ID');

// =====================================================
// CLASS BARANG - ENKAPSULASI
// =====================================================

class Barang {
  String nama;
  double harga;

  // Stok dibuat private agar tidak bisa diubah sembarangan
  // dari luar class.
  int _stok;

  // Konstruktor
  Barang(this.nama, this.harga, this._stok);

  // Getter untuk membaca stok
  int get stok => _stok;

  // Method menampilkan kartu barang
  void tampilkan() {
    print("=== KARTU BARANG ===");
    print("Nama : $nama");
    print("Harga : Rp${formatRupiah.format(harga)}");
    print("Stok : $_stok");
    print("Tersedia : ${_stok > 0}");
    print("");
  }

  // =====================================================
  // NILAI STOK
  // =====================================================

  double nilaiStok() {
    return harga * _stok;
  }

  // =====================================================
  // CEK BARANG BISA DIJUAL
  // =====================================================

  bool bisaDijual(int diminta) {
    return diminta > 0 && diminta <= _stok;
  }

  // =====================================================
  // ENKAPSULASI - PENJUALAN
  // =====================================================

  bool jual(int n) {
    if (n > 0 && n <= _stok) {
      _stok -= n;
      return true;
    }

    return false;
  }
}

// =====================================================
// CLASS PEMBELI
// =====================================================

class Pembeli {
  String nama;
  bool anggota;

  // Konstruktor
  Pembeli(this.nama, this.anggota);

  // Method menampilkan data pembeli
  void tampilkan() {
    print("=== DATA PEMBELI ===");
    print("Nama : $nama");

    if (anggota) {
      print("Status : Anggota");
    } else {
      print("Status : Umum");
    }

    print("");
  }
}

// =====================================================
// PEWARISAN - BARANG PROMO
// =====================================================

class BarangPromo extends Barang {
  // Atribut tambahan
  double persenDiskon;

  // Konstruktor
  BarangPromo(
    String nama,
    double harga,
    int stok,
    this.persenDiskon,
  ) : super(nama, harga, stok);

  // Method khusus BarangPromo
  double hargaPromo() {
    return harga - (harga * persenDiskon / 100);
  }
}

// =====================================================
// SPRINT 4 - FUNGSI
// =====================================================

// Menghitung total pembelian
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Menghitung harga akhir setelah potongan
double hitungHargaAkhir(
  double total,
  double persenPotongan,
) {
  return total - (total * persenPotongan / 100);
}

// =====================================================
// MAIN
// =====================================================

void main() {
  // =====================================================
  // SPRINT 1 - DATA BARANG
  // =====================================================

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int stok = 40;

  // =====================================================
  // KETERSEDIAAN BARANG
  // =====================================================

  bool tersedia;

  if (stok == 0) {
    tersedia = false;
  } else {
    tersedia = true;
  }

  print("=== KARTU DATA BARANG ===");
  print("Nama : $namaBarang");
  print(
    "Harga Anggota : Rp${formatRupiah.format(hargaAnggota)}",
  );
  print(
    "Harga Umum : Rp${formatRupiah.format(hargaUmum)}",
  );
  print("Stok : $stok");
  print("Tersedia : $tersedia");

  // =====================================================
  // SPRINT 1 - PERHITUNGAN
  // =====================================================

  int jumlahBeli = 3;

  double totalAnggota = hitungTotal(
    jumlahBeli,
    hargaAnggota,
  );

  double totalUmum = hitungTotal(
    jumlahBeli,
    hargaUmum,
  );

  double selisih = totalUmum - totalAnggota;

  print("");
  print("=== PERHITUNGAN ===");

  print(
    "Total (anggota) $jumlahBeli pcs: "
    "Rp${formatRupiah.format(totalAnggota)}",
  );

  print(
    "Selisih vs umum : "
    "Rp${formatRupiah.format(selisih)}",
  );

  // =====================================================
  // SPRINT 2 - STATUS PEMBELI
  // =====================================================

  bool anggota = true;

  double harga;

  if (anggota) {
    harga = hargaAnggota;
  } else {
    harga = hargaUmum;
  }

  double total = hitungTotal(
    jumlahBeli,
    harga,
  );

  print("");
  print("=== STATUS PEMBELI ===");

  if (anggota) {
    print("Pembeli : Anggota");
    print("Harga yang digunakan : Harga Anggota");
  } else {
    print("Pembeli : Umum");
    print("Harga yang digunakan : Harga Umum");
  }

  // =====================================================
  // SPRINT 2 - POTONGAN
  // =====================================================

  double persenPotongan;

  if (total < 0) {
    print("Error: Total tidak boleh negatif.");
    persenPotongan = 0;
  } else if (anggota && total > 500000) {
    persenPotongan = 15;
  } else if (total > 200000) {
    persenPotongan = 10;
  } else if (total > 100000) {
    persenPotongan = 5;
  } else {
    persenPotongan = 0;
  }

  // =====================================================
  // SPRINT 4 - HARGA AKHIR
  // =====================================================

  double hargaAkhir = hitungHargaAkhir(
    total,
    persenPotongan,
  );

  double nilaiPotongan = total - hargaAkhir;

  print("");
  print("=== TRANSAKSI ===");
  print(
    "Total : Rp${formatRupiah.format(total)}",
  );
  print("Potongan : $persenPotongan%");
  print(
    "Nilai Potongan : "
    "Rp${formatRupiah.format(nilaiPotongan)}",
  );
  print(
    "Harga Akhir : "
    "Rp${formatRupiah.format(hargaAkhir)}",
  );

  // =====================================================
  // SPRINT 2 - KATEGORI DENGAN SWITCH
  // =====================================================

  String kategori = "atk";
  String rak;

  switch (kategori) {
    case "atk":
      rak = "Rak 1";
      break;

    case "makanan":
      rak = "Rak 2";
      break;

    case "minuman":
      rak = "Rak 3";
      break;

    default:
      rak = "Rak lain";
  }

  print("");
  print("=== KATEGORI ===");
  print("Kategori : $kategori");
  print("Rak : $rak");

  // Switch lebih rapi daripada banyak if karena satu variabel
  // dibandingkan dengan beberapa pilihan nilai.
  // Setiap pilihan memiliki case sendiri sehingga lebih mudah dibaca.

  // =====================================================
  // SPRINT 3 - DAFTAR BARANG DENGAN FOR
  // =====================================================

  List<String> daftarBarang = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti",
  ];

  List<double> daftarHarga = [
    3000,
    2500,
    1500,
    5000,
  ];

  print("");
  print("=== DAFTAR BARANG ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    print(
      "${i + 1}. ${daftarBarang[i]} - "
      "Rp. ${formatRupiah.format(daftarHarga[i])}",
    );
  }

  // =====================================================
  // SPRINT 3 - DATA STOK
  // =====================================================

  List<int> daftarStok = [
    40,
    30,
    3,
    15,
  ];

  // =====================================================
  // SPRINT 3 - TOTAL NILAI SELURUH STOK
  // =====================================================

  double totalNilaiStok = 0;

  for (int i = 0; i < daftarBarang.length; i++) {
    double nilaiStok =
        daftarHarga[i] * daftarStok[i];

    totalNilaiStok =
        totalNilaiStok + nilaiStok;
  }

  print("");
  print("=== TOTAL NILAI SELURUH STOK ===");

  print(
    "Total nilai stok : "
    "Rp${formatRupiah.format(totalNilaiStok)}",
  );

  // Akumulator digunakan untuk menjumlahkan nilai seluruh stok.
  // Setiap barang dihitung dengan harga dikali jumlah stok,
  // kemudian hasilnya ditambahkan ke total nilai stok.

  // =====================================================
  // SPRINT 3 - STOK MENIPIS
  // =====================================================

  print("");
  print("=== STOK MENIPIS ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    if (daftarStok[i] < 5) {
      print(
        "${daftarBarang[i]} - "
        "Sisa stok: ${daftarStok[i]}",
      );
    }
  }

  // Laporan stok menipis berguna untuk mengetahui barang
  // yang hampir habis sehingga koperasi dapat segera
  // melakukan pembelian atau pengadaan stok kembali.

  // =====================================================
  // SPRINT 3 - PENJUALAN DENGAN WHILE
  // =====================================================

  int stokBukuTulis = 3;

  print("");
  print("--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis = stokBukuTulis - 1;

    print(
      "Terjual 1, sisa stok: $stokBukuTulis",
    );
  }

  // Bahaya jika kondisi berhenti pada while keliru adalah
  // perulangan dapat berjalan terlalu banyak dan menyebabkan
  // stok menjadi negatif atau barang terjual melebihi stok.
  //
  // Untuk memastikan koperasi tidak menjual melebihi stok,
  // gunakan kondisi stokBukuTulis > 0 sehingga penjualan
  // berhenti tepat ketika stok mencapai 0.

  // =====================================================
  // SPRINT 4 - CONTOH FUNGSI
  // =====================================================

  print("");
  print("=== CONTOH FUNGSI SPRINT 4 ===");

  int jumlahContoh = 10;
  double hargaContoh = 5000.0;

  double totalContoh = hitungTotal(
    jumlahContoh,
    hargaContoh,
  );

  double persenPotonganContoh = 5;

  double hargaAkhirContoh =
      hitungHargaAkhir(
    totalContoh,
    persenPotonganContoh,
  );

  print("Jumlah : $jumlahContoh");

  print(
    "Harga : "
    "Rp${formatRupiah.format(hargaContoh)}",
  );

  print(
    "Total : "
    "Rp${formatRupiah.format(totalContoh)}",
  );

  print(
    "Potongan : "
    "$persenPotonganContoh%",
  );

  print(
    "Harga Akhir : "
    "Rp${formatRupiah.format(hargaAkhirContoh)}",
  );

  // Pemecahan program menjadi fungsi membuat kode lebih rapi,
  // mudah digunakan kembali, dan mengurangi pengulangan rumus.
  // Jika aturan potongan diubah, cukup mengubah fungsi
  // hitungHargaAkhir() sehingga penerapannya konsisten.

  // =====================================================
  // SPRINT 5 - OBJEK BARANG
  // =====================================================

  Barang bukuTulis = Barang(
    "Buku Tulis",
    3000.0,
    40,
  );

  Barang pulpen = Barang(
    "Pulpen",
    2500.0,
    30,
  );

  Barang roti = Barang(
    "Roti",
    5000.0,
    15,
  );

  // =====================================================
  // SPRINT 5 - LIST BARANG
  // =====================================================

  List<Barang> daftarBarangOOP = [
    bukuTulis,
    pulpen,
    roti,
  ];

  print("");
  print("=== DAFTAR BARANG BERBASIS OBJEK ===");

  for (Barang barang in daftarBarangOOP) {
    barang.tampilkan();
  }

  // Dibandingkan cara Sprint 3 yang menggunakan List nama,
  // List harga, dan List stok secara terpisah, List<Barang>
  // lebih rapi karena seluruh data setiap barang disimpan
  // dalam satu objek.
  //
  // Jika jumlah barang bertambah, cukup membuat objek Barang
  // baru dan memasukkannya ke dalam List<Barang>.

  // =====================================================
  // NILAI STOK SETIAP BARANG
  // =====================================================

  print("");
  print("=== NILAI STOK SETIAP BARANG ===");

  for (Barang barang in daftarBarangOOP) {
    print(
      "${barang.nama} : "
      "Rp${formatRupiah.format(barang.nilaiStok())}",
    );
  }

  // Nilai stok berguna untuk mengetahui perkiraan nilai
  // aset atau persediaan barang yang masih dimiliki koperasi.
  // Nilai tersebut dapat digunakan dalam laporan aset koperasi.

  // =====================================================
  // CEK BISA DIJUAL
  // =====================================================

  int diminta = 2;

  print("");
  print("=== CEK PENJUALAN ===");

  if (bukuTulis.bisaDijual(diminta)) {
    print(
      "Bisa dijual: "
      "$diminta ${bukuTulis.nama}",
    );
  } else {
    print(
      "Tidak bisa dijual: "
      "stok ${bukuTulis.nama} tidak mencukupi.",
    );
  }

  // Pengecekan bisaDijual() diletakkan di dalam objek Barang
  // agar aturan kecukupan stok menjadi bagian dari data dan
  // perilaku barang.
  //
  // Dengan begitu, setiap transaksi dapat menggunakan
  // pengecekan yang sama tanpa menulis ulang kondisi stok
  // di banyak tempat.
  //
  // Hal ini membuat kode lebih rapi, konsisten, dan
  // mengurangi risiko menjual barang melebihi stok.

  // =====================================================
  // PEMBELI
  // =====================================================

  Pembeli pembeli = Pembeli(
    "Lody",
    true,
  );

  print("");
  pembeli.tampilkan();

  // Relasi yang wajar antara Pembeli dan Barang adalah
  // hubungan transaksi.
  //
  // Satu Pembeli dapat membeli satu atau beberapa Barang
  // dalam satu transaksi.
  //
  // Barang tetap menjadi objek yang berdiri sendiri,
  // sedangkan Pembeli membeli Barang melalui transaksi.

  // =====================================================
  // PEWARISAN - BARANG PROMO
  // =====================================================

  BarangPromo promo = BarangPromo(
    "Buku Tulis Promo",
    3000.0,
    20,
    10.0,
  );

  print("");
  print("=== BARANG PROMO ===");

  // Method tampilkan() diwarisi dari Barang
  promo.tampilkan();

  print(
    "Diskon : ${promo.persenDiskon}%",
  );

  print(
    "Harga Promo : "
    "Rp${formatRupiah.format(promo.hargaPromo())}",
  );

  // BarangPromo mewarisi nama, harga, _stok, getter stok,
  // tampilkan(), nilaiStok(), bisaDijual(), dan jual()
  // dari Barang.
  //
  // BarangPromo memiliki tambahan persenDiskon dan
  // method hargaPromo().

  // =====================================================
  // SPRINT TERBARU - UJI ENKAPSULASI
  // =====================================================

  print("");
  print("=== UJI ENKAPSULASI ===");

  Barang barangUji = Barang(
    "Penghapus",
    1500.0,
    10,
  );

  // Membaca stok menggunakan getter
  print("Stok awal : ${barangUji.stok}");

  // Menjual 3 barang
  bool penjualanBerhasil = barangUji.jual(3);

  print(
    "Jual 3 barang : $penjualanBerhasil",
  );

  print(
    "Stok setelah penjualan : "
    "${barangUji.stok}",
  );

  // Mencoba menjual melebihi stok
  bool penjualanGagal = barangUji.jual(20);

  print(
    "Jual 20 barang : $penjualanGagal",
  );

  print(
    "Stok setelah percobaan : "
    "${barangUji.stok}",
  );

  // =====================================================
  // PENJELASAN ENKAPSULASI
  // =====================================================

  // Enkapsulasi mencegah stok diubah sembarangan dengan
  // menjadikan stok sebagai atribut private _stok.
  //
  // Stok hanya dapat dibaca dari luar class menggunakan
  // getter stok.
  //
  // Perubahan stok hanya dilakukan melalui method jual()
  // yang memeriksa apakah jumlah yang dijual mencukupi.
  //
  // Dengan cara ini stok tidak dapat berkurang sembarangan
  // atau menjadi negatif.

  // Jangan mengubah stok secara langsung seperti:
  //
  // barangUji.stok = 5;
  //
  // Karena getter stok hanya digunakan untuk membaca.
  // Untuk mengubah stok gunakan:
  //
  // barangUji.jual(3);

  // Mengapa melindungi _stok penting bagi integritas data koperasi?
//
// Melindungi _stok penting agar jumlah stok tidak dapat diubah
// sembarangan dari luar class Barang. Perubahan stok hanya boleh
// dilakukan melalui method jual() yang sudah melakukan pengecekan.
// Dengan begitu, stok tidak menjadi negatif atau tidak sesuai
// dengan transaksi yang sebenarnya sehingga data koperasi tetap
// akurat dan dapat dipercaya.
}