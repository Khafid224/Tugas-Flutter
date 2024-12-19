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
          title: Text("Dialog Example"), // Judul aplikasi di AppBar
        ),
        body:
            DialogExample(), // Memanggil widget DialogExample sebagai isi body
      ),
    );
  }
}

// Widget untuk menampilkan contoh penggunaan dialog
class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Memusatkan kolom di tengah
        children: [
          // Tombol untuk menampilkan dialog bawaan Flutter
          ElevatedButton(
            onPressed: () {
              // Menampilkan dialog menggunakan metode bawaan Flutter
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Hello"), // Judul dialog
                  content: Text("This is a normal dialog"), // Isi pesan dialog
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Menutup dialog
                      child: Text("Close"), // Teks tombol untuk menutup dialog
                    ),
                  ],
                ),
              );
            },
            child: Text("Show Normal Dialog"), // Label tombol
          ),
          const SizedBox(height: 20), // Jarak antara tombol
          // Tombol untuk menampilkan dialog menggunakan GetX
          ElevatedButton(
            onPressed: () {
              // Menampilkan dialog menggunakan fitur GetX
              Get.defaultDialog(
                title: "Hello", // Judul dialog
                middleText: "This is a GetX dialog", // Isi pesan dialog
              );
            },
            child: Text("Show GetX Dialog"), // Label tombol
          ),
        ],
      ),
    );
  }
}
