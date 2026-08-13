import 'package:intl/intl.dart';

final formatRupiah = NumberFormat('#,##0', 'id_ID');

class Barang {
  String nama;
  double harga;
  int _stok;

  Barang(this.nama, this.harga, this._stok);

  int get stok => _stok;

  void tampilkan() {
    print("=== KARTU BARANG ===");
    print("Nama : $nama");
    print("Harga : Rp${formatRupiah.format(harga)}");
    print("Stok : $_stok");
    print("Tersedia : ${_stok > 0}");
    print("");
  }

  double nilaiStok() {
    return harga * _stok;
  }

  bool bisaDijual(int diminta) {
    return diminta > 0 && diminta <= _stok;
  }

  bool jual(int n) {
    if (n > 0 && n <= _stok) {
      _stok -= n;
      return true;
    }
    return false;
  }
}

class Pembeli {
  String nama;
  bool anggota;

  Pembeli(this.nama, this.anggota);

  void tampilkan() {
    print("=== DATA PEMBELI ===");
    print("Nama : $nama");
    print("Status : ${anggota ? "Anggota" : "Umum"}");
    print("");
  }
}

class BarangPromo extends Barang {
  double persenDiskon;

  BarangPromo(
    String nama,
    double harga,
    int stok,
    this.persenDiskon,
  ) : super(nama, harga, stok);

  double hargaPromo() {
    return harga - (harga * persenDiskon / 100);
  }
}

double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

double hitungHargaAkhir(
  double total,
  double persenPotongan,
) {
  return total - (total * persenPotongan / 100);
}

void prosesBeli(String inputJumlah, Barang barang) {
  try {
    int jumlah = int.parse(inputJumlah);

    if (jumlah <= 0) {
      throw Exception();
    }

    if (!barang.bisaDijual(jumlah)) {
      throw Exception();
    }

    bool berhasil = barang.jual(jumlah);

    if (berhasil) {
      print("Berhasil membeli $jumlah ${barang.nama}.");
      print("Sisa stok : ${barang.stok}");
    }
  } catch (e) {
    print(
      "Input atau transaksi tidak valid. "
      "Silakan periksa kembali jumlah pembelian.",
    );
  } finally {
    print("Transaksi dicatat di log.");
  }
}

void main() {
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int stok = 40;

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

  List<int> daftarStok = [
    40,
    30,
    3,
    15,
  ];

  print("");
  print("=== DAFTAR BARANG ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    print(
      "${i + 1}. ${daftarBarang[i]} - "
      "Rp${formatRupiah.format(daftarHarga[i])}",
    );
  }

  double totalNilaiStok = 0;

  for (int i = 0; i < daftarBarang.length; i++) {
    double nilaiStok =
        daftarHarga[i] * daftarStok[i];

    totalNilaiStok += nilaiStok;
  }

  print("");
  print("=== TOTAL NILAI SELURUH STOK ===");
  print(
    "Total nilai stok : "
    "Rp${formatRupiah.format(totalNilaiStok)}",
  );

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

  int stokBukuTulis = 3;

  print("");
  print("--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis--;

    print(
      "Terjual 1, sisa stok: $stokBukuTulis",
    );
  }

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

  print("");
  print("=== NILAI STOK SETIAP BARANG ===");

  for (Barang barang in daftarBarangOOP) {
    print(
      "${barang.nama} : "
      "Rp${formatRupiah.format(barang.nilaiStok())}",
    );
  }

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
      "Tidak bisa dijual karena stok tidak mencukupi.",
    );
  }

  Pembeli pembeli = Pembeli(
    "Lody",
    true,
  );

  print("");
  pembeli.tampilkan();

  BarangPromo promo = BarangPromo(
    "Buku Tulis Promo",
    3000.0,
    20,
    10.0,
  );

  print("");
  print("=== BARANG PROMO ===");
  promo.tampilkan();

  print(
    "Diskon : ${promo.persenDiskon}%",
  );

  print(
    "Harga Promo : "
    "Rp${formatRupiah.format(promo.hargaPromo())}",
  );

  print("");
  print("=== UJI ENKAPSULASI ===");

  Barang barangUji = Barang(
    "Penghapus",
    1500.0,
    10,
  );

  print("Stok awal : ${barangUji.stok}");

  bool penjualanBerhasil =
      barangUji.jual(3);

  print(
    "Jual 3 barang : $penjualanBerhasil",
  );

  print(
    "Stok setelah penjualan : "
    "${barangUji.stok}",
  );

  bool penjualanGagal =
      barangUji.jual(20);

  print(
    "Jual 20 barang : $penjualanGagal",
  );

  print(
    "Stok setelah percobaan : "
    "${barangUji.stok}",
  );

  print("");
  print("=== EXCEPTION HANDLING ===");

  Barang barangTransaksi = Barang(
    "Buku Tulis",
    3000.0,
    10,
  );

  print("--- Input benar: 2 ---");
  prosesBeli("2", barangTransaksi);

  print("--- Input salah: dua ---");
  prosesBeli("dua", barangTransaksi);

  print("--- Melebihi stok: 20 ---");
  prosesBeli("20", barangTransaksi);

  // Bagaimana penanganan galat meningkatkan kepercayaan pengurus pada sistem?
  //
  // Penanganan galat membuat program tetap berjalan ketika terjadi
  // kesalahan input dari petugas. Program memberikan pesan yang jelas
  // sehingga petugas dapat memperbaiki input tanpa kehilangan transaksi.
  // Hal ini meningkatkan kepercayaan pengurus karena sistem lebih aman,
  // stabil, dan tidak mudah berhenti akibat kesalahan manusia.

  // Mengapa melindungi _stok penting bagi integritas data koperasi?
  //
  // Melindungi _stok penting agar jumlah stok tidak dapat diubah
  // sembarangan dari luar class Barang. Perubahan stok hanya boleh
  // dilakukan melalui method jual() yang sudah melakukan pengecekan.
  // Dengan begitu, stok tetap akurat dan sesuai dengan transaksi.
}