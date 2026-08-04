
void main() {
  // Data barang
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int jumlahStok = 40;
  bool tersedia = true;

  int jumlahBeli = 3;
  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;
  print("=== KARTU DATA BARANG ===");
  print("Nama : $namaBarang");
  print("Harga Anggota : Rp$hargaAnggota");
  print("Harga Umum : Rp$hargaUmum");
  print("Stok : $jumlahStok");
  print("Tersedia : $tersedia");
  print("Total (anggota) $jumlahBeli pcs: Rp$totalAnggota");
  print("Selisih vs umum : Rp$selisih");
}
// Mengapa pemilihan tipe data pada program ini penting bagi keakuratan kasir koperasi?
// Pemilihan tipe data yang tepat membuat harga dan jumlah stok dapat dihitung dengan benar.
// Kesalahan tipe data dapat menyebabkan perhitungan harga atau stok menjadi tidak akurat.