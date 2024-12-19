import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menggunakan GetMaterialApp untuk mendukung fitur GetX
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Sheet Example"), // Judul aplikasi
        ),
        body:
            BottomSheetExample(), // Memanggil widget BottomSheetExample sebagai isi body
      ),
    );
  }
}

// Widget untuk menampilkan contoh penggunaan Bottom Sheet
class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Memusatkan kolom di tengah
        children: [
          // Tombol untuk menampilkan Bottom Sheet bawaan Flutter
          ElevatedButton(
            onPressed: () {
              // Menampilkan Bottom Sheet menggunakan metode bawaan Flutter
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsets.all(16), // Memberikan padding
                  child: Text(
                    "This is a normal bottom sheet", // Pesan teks
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
            child: Text("Show Normal Bottom Sheet"), // Label tombol
          ),
          const SizedBox(height: 20), // Jarak antara tombol
          // Tombol untuk menampilkan Bottom Sheet menggunakan GetX
          ElevatedButton(
            onPressed: () {
              // Menampilkan Bottom Sheet menggunakan GetX
              Get.bottomSheet(
                Container(
                  color: Colors.white, // Latar belakang putih
                  padding: EdgeInsets.all(16), // Memberikan padding
                  child: Text(
                    "This is a GetX bottom sheet", // Pesan teks
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                backgroundColor:
                    Colors.grey[200], // Warna latar tambahan (opsional)
                barrierColor:
                    Colors.black.withOpacity(0.5), // Efek latar belakang gelap
              );
            },
            child: Text("Show GetX Bottom Sheet"), // Label tombol
          ),
        ],
      ),
    );
  }
}
