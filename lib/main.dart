import 'package:intl/intl.dart';
void main() {
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 12500.0;
  double hargaUmum = 15000.0;
  int jumlahStok = 40;
  bool anggota = true;
  String kategori = "atk";
  bool tersedia;
  if (jumlahStok == 0) {
    tersedia = false;
  } else {
    tersedia = true;
  }
  double harga;
  if (anggota) {
    harga = hargaAnggota;
  } else {
    harga = hargaUmum;
  }
  int jumlahBeli = 10;
  double total = harga * jumlahBeli;
  double persenPotongan;
  if (total > 200000) {
    persenPotongan = 0.10;
  } else if (total > 100000) {
    persenPotongan = 0.05;
  } else {
    persenPotongan = 0.0;
  }
  double potongan = total * persenPotongan;
  double hargaAkhir = total - potongan;
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
  final formatRupiah = NumberFormat('#,##0', 'id_ID');
  print("=== DATA KOPERASI ===");
  print("Nama Barang : $namaBarang");
  print("Kategori : $kategori");
  print("Rak : $rak");
  print("Harga Anggota : Rp${formatRupiah.format(hargaAnggota)}");
  print("Harga Umum : Rp${formatRupiah.format(hargaUmum)}");
  print("Stok : $jumlahStok");
  print("Tersedia : $tersedia");
  print("=== TRANSAKSI ===");
  print("Status Anggota : $anggota");
  print("Jumlah Beli : $jumlahBeli");
  print("Harga Satuan : Rp${formatRupiah.format(harga)}");
  print("Total Sebelum Potongan : Rp${formatRupiah.format(total)}");
  print("Potongan : ${persenPotongan * 100}%");
  print("Nilai Potongan : Rp${formatRupiah.format(potongan)}");
  print("Harga Akhir : Rp${formatRupiah.format(hargaAkhir)}");
  // Switch lebih rapi daripada banyak if karena digunakan untuk
  // membandingkan satu variabel dengan beberapa pilihan nilai yang tetap.
  // Dengan switch, setiap kategori memiliki case sendiri sehingga kode
  // lebih mudah dibaca dan dikelola.
}

