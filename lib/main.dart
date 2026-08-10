import 'package:intl/intl.dart';

// =====================================================
// CLASS BARANG
// =====================================================

class Barang {
  // Atribut
  String nama;
  double harga;
  int stok;

  // Konstruktor
  Barang(this.nama, this.harga, this.stok);

  // Method untuk menampilkan kartu barang
  void tampilkan() {
    print("=== KARTU BARANG ===");
    print("Nama : $nama");
    print("Harga : Rp${formatRupiah.format(harga)}");
    print("Stok : $stok");
    print("Tersedia : ${stok > 0}");
    print("");
  }
}

// Format rupiah
final formatRupiah = NumberFormat('#,##0', 'id_ID');

void main() {
  // =====================================================
  // 1. DATA BARANG
  // =====================================================

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int stok = 40;

  // =====================================================
  // 2. KETERSEDIAAN BARANG
  // =====================================================

  bool tersedia;

  if (stok == 0) {
    tersedia = false;
  } else {
    tersedia = true;
  }

  print("=== KARTU DATA BARANG ===");
  print("Nama : $namaBarang");
  print("Harga Anggota : Rp${formatRupiah.format(hargaAnggota)}");
  print("Harga Umum : Rp${formatRupiah.format(hargaUmum)}");
  print("Stok : $stok");
  print("Tersedia : $tersedia");

  // =====================================================
  // 3. PERHITUNGAN 3 BUKU
  // =====================================================

  int jumlahBeli = 3;

  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  print("");
  print("=== PERHITUNGAN ===");
  print(
    "Total (anggota) $jumlahBeli pcs: Rp${formatRupiah.format(totalAnggota)}",
  );
  print(
    "Selisih vs umum : Rp${formatRupiah.format(selisih)}",
  );

  // =====================================================
  // 4. STATUS ANGGOTA DAN PEMILIHAN HARGA
  // =====================================================

  bool anggota = true;

  double harga;

  if (anggota) {
    harga = hargaAnggota;
  } else {
    harga = hargaUmum;
  }

  double total = harga * jumlahBeli;

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
  // 5. POTONGAN
  // =====================================================

  double persenPotongan;

  if (total < 0) {
    print("Error: Total tidak boleh negatif.");
    persenPotongan = 0.0;
  } else if (anggota && total > 500000) {
    persenPotongan = 0.15;
  } else if (total > 200000) {
    persenPotongan = 0.10;
  } else if (total > 100000) {
    persenPotongan = 0.05;
  } else {
    persenPotongan = 0.0;
  }

  double nilaiPotongan = total * persenPotongan;
  double hargaAkhir = total - nilaiPotongan;

  print("");
  print("=== TRANSAKSI ===");
  print("Total : Rp${formatRupiah.format(total)}");
  print("Potongan : ${persenPotongan * 100}%");
  print(
    "Nilai Potongan : Rp${formatRupiah.format(nilaiPotongan)}",
  );
  print("Harga Akhir : Rp${formatRupiah.format(hargaAkhir)}");

  // =====================================================
  // 6. KATEGORI DENGAN SWITCH
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
  // 7. DAFTAR BARANG DENGAN FOR
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
      "${i + 1}. ${daftarBarang[i]} - Rp. ${formatRupiah.format(daftarHarga[i])}",
    );
  }

  // =====================================================
  // 8. STOK SETIAP BARANG
  // =====================================================

  List<int> daftarStok = [
    40,
    30,
    3,
    15,
  ];

  // =====================================================
  // 9. TOTAL NILAI SELURUH STOK
  // =====================================================

  double totalNilaiStok = 0;

  for (int i = 0; i < daftarBarang.length; i++) {
    double nilaiStok = daftarHarga[i] * daftarStok[i];

    totalNilaiStok = totalNilaiStok + nilaiStok;
  }

  print("");
  print("=== TOTAL NILAI SELURUH STOK ===");
  print(
    "Total nilai stok : Rp${formatRupiah.format(totalNilaiStok)}",
  );

  // Akumulator digunakan untuk menjumlahkan nilai seluruh stok.
  // Setiap barang dihitung dengan harga dikali jumlah stok,
  // kemudian hasilnya ditambahkan ke total nilai stok.

  // =====================================================
  // 10. LAPORAN STOK MENIPIS
  // =====================================================

  print("");
  print("=== STOK MENIPIS ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    if (daftarStok[i] < 5) {
      print(
        "${daftarBarang[i]} - Sisa stok: ${daftarStok[i]}",
      );
    }
  }

  // Laporan stok menipis berguna untuk mengetahui barang
  // yang hampir habis sehingga koperasi dapat segera
  // melakukan pembelian atau pengadaan stok kembali.
  // Dengan laporan ini, koperasi dapat mencegah kehabisan
  // barang dan tetap memenuhi kebutuhan pembeli.

  // =====================================================
  // 11. PENJUALAN DENGAN WHILE
  // =====================================================

  int stokBukuTulis = 3;

  print("");
  print("--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis = stokBukuTulis - 1;

    print("Terjual 1, sisa stok: $stokBukuTulis");
  }

  // Bahaya jika kondisi berhenti pada while keliru adalah
  // perulangan dapat berjalan terlalu banyak dan menyebabkan
  // stok menjadi negatif atau barang terjual melebihi stok.
  // Untuk memastikan koperasi tidak menjual melebihi stok,
  // gunakan kondisi while stokBukuTulis > 0 sehingga penjualan
  // otomatis berhenti ketika stok sudah mencapai 0.

  // =====================================================
  // 12. OOP - MEMBUAT 3 OBJEK BARANG
  // =====================================================

  print("");
  print("=== DATA BARANG DENGAN OOP ===");

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

  // Memanggil method tampilkan() dari setiap objek
  bukuTulis.tampilkan();
  pulpen.tampilkan();
  roti.tampilkan();

  // =====================================================
  // KOMENTAR TIPE DATA
  // =====================================================

  // Pemilihan tipe data yang tepat penting bagi keakuratan
  // kasir koperasi karena setiap data memiliki fungsi berbeda.
  // String digunakan untuk nama, double untuk harga,
  // int untuk stok, dan bool untuk status ketersediaan.
}