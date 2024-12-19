import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menggunakan GetMaterialApp agar mendukung fitur GetX seperti snackbar
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar Example"), // Judul aplikasi di AppBar
        ),
        body: SnackBarExample(), // Memanggil widget SnackBarExample
      ),
    );
  }
}

// Widget untuk menampilkan contoh penggunaan SnackBar
class SnackBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Memusatkan konten di tengah
        children: [
          ElevatedButton(
            onPressed: () {
              // Menampilkan snackbar menggunakan Flutter bawaan
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hello from snackbar"), // Pesan di snackbar
                ),
              );
            },
            child: Text(
                "Show Normal Snackbar"), // Teks tombol untuk snackbar biasa
          ),
          ElevatedButton(
            onPressed: () {
              // Menampilkan snackbar menggunakan GetX
              Get.snackbar(
                "Hello", // Judul snackbar
                "This is Getx SnackBar", // Pesan di snackbar
                snackPosition: SnackPosition.BOTTOM, // Posisi snackbar di bawah
              );
            },
            child: Text(
                "Show GetX SnackBar"), // Teks tombol untuk snackbar dengan GetX
          ),
        ],
      ),
    );
  }
}
