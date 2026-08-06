import 'package:intl/intl.dart';

void main() {
  final formatRupiah = NumberFormat('#,##0', 'id_ID');



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
  print("Harga Anggota : Rp${formatRupiah.format(hargaAnggota)}");
  print("Harga Umum : Rp${formatRupiah.format(hargaUmum)}");
  print("Stok : $stok");
  print("Tersedia : $tersedia");



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

  print("");
  print("=== DAFTAR BARANG ===");

  for (int i = 0; i < daftarBarang.length; i++) {
    print(
      "${i + 1}. ${daftarBarang[i]} - Rp. ${formatRupiah.format(daftarHarga[i])}",
    );
  }

  int stokBukuTulis = 3;

  print("");
  print("--- Penjualan Buku Tulis ---");

  while (stokBukuTulis > 0) {
    stokBukuTulis = stokBukuTulis - 1;

    print("Terjual 1, sisa stok: $stokBukuTulis");
  }

}