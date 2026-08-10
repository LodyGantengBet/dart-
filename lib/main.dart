import 'package:intl/intl.dart';

final formatRupiah = NumberFormat('#,##0', 'id_ID');

// Fungsi menghitung total
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Fungsi menghitung harga akhir
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

void main() {
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int stok = 40;

  bool tersedia = stok > 0;

  print("=== KARTU DATA BARANG ===");
  print("Nama : $namaBarang");
  print("Harga Anggota : Rp${formatRupiah.format(hargaAnggota)}");
  print("Harga Umum : Rp${formatRupiah.format(hargaUmum)}");
  print("Stok : $stok");
  print("Tersedia : $tersedia");

  int jumlahBeli = 3;

  double totalAnggota = hitungTotal(jumlahBeli, hargaAnggota);
  double totalUmum = hitungTotal(jumlahBeli, hargaUmum);
  double selisih = totalUmum - totalAnggota;

  print("");
  print("=== PERHITUNGAN ===");
  print(
      "Total (anggota) $jumlahBeli pcs: Rp${formatRupiah.format(totalAnggota)}");
  print("Selisih vs umum : Rp${formatRupiah.format(selisih)}");

  bool anggota = true;

  double harga;

  if (anggota) {
    harga = hargaAnggota;
  } else {
    harga = hargaUmum;
  }

  double total = hitungTotal(jumlahBeli, harga);

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

  double hargaAkhir = hitungHargaAkhir(total, persenPotongan);
  double nilaiPotongan = total - hargaAkhir;

  print("");
  print("=== TRANSAKSI ===");
  print("Total : Rp${formatRupiah.format(total)}");
  print("Potongan : $persenPotongan%");
  print("Nilai Potongan : Rp${formatRupiah.format(nilaiPotongan)}");
  print("Harga Akhir : Rp${formatRupiah.format(hargaAkhir)}");

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
    "Roti"
  ];

  List<double> daftarHarga = [
    3000,
    2500,
    1500,
    5000
  ];

  print("");
  print("=== DAFTAR BARANG ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    print(
        "${i + 1}. ${daftarBarang[i]} - Rp${formatRupiah.format(daftarHarga[i])}");
  }

  List<int> daftarStok = [
    40,
    30,
    3,
    15
  ];

  double totalNilaiStok = 0;

  for (int i = 0; i < daftarBarang.length; i++) {
    totalNilaiStok += daftarHarga[i] * daftarStok[i];
  }

  print("");
  print("=== TOTAL NILAI STOK ===");
  print("Rp${formatRupiah.format(totalNilaiStok)}");

  print("");
  print("=== STOK MENIPIS ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    if (daftarStok[i] < 5) {
      print("${daftarBarang[i]} - Stok: ${daftarStok[i]}");
    }
  }

  int stokBukuTulis = 3;

  print("");
  print("--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis--;
    print("Terjual 1, sisa stok: $stokBukuTulis");
  }

  print("");
  print("=== CONTOH FUNGSI ===");

  double totalContoh = hitungTotal(10, 5000);
  double akhirContoh = hitungHargaAkhir(totalContoh, 5);

  print("Total : Rp${formatRupiah.format(totalContoh)}");
  print("Harga Akhir : Rp${formatRupiah.format(akhirContoh)}");

  // Pemecahan program menjadi fungsi membuat kode lebih rapi,
  // mudah digunakan kembali, dan mengurangi pengulangan kode.
  // Jika aturan potongan berubah, cukup mengubah fungsi
  // hitungHargaAkhir() satu kali tanpa mengubah seluruh program.
}