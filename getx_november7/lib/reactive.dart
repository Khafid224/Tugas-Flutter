import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk contoh penggunaan variabel reaktif
class ReactiveController extends GetxController {
  var name = "User".obs; // Variabel reaktif menggunakan .obs

  // Method untuk mengubah nilai variabel name
  void changeName(String newName) {
    name.value = newName; // Mengubah nilai menggunakan .value
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menggunakan GetMaterialApp
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reactive Variables Example"), // Judul aplikasi
        ),
        body:
            ReactiveExample(), // Memanggil widget ReactiveExample sebagai body
      ),
    );
  }
}

// Widget untuk menampilkan contoh penggunaan variabel reaktif
class ReactiveExample extends StatelessWidget {
  final ReactiveController rc = Get.put(
      ReactiveController()); // Menginisialisasi controller dengan Get.put

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Menyusun elemen di tengah
        children: [
          // Menampilkan nilai variabel reaktif menggunakan Obx
          Obx(() => Text(
                "Name: ${rc.name}", // Menampilkan nilai terkini dari rc.name
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(height: 20), // Jarak antar widget
          // Input untuk mengubah nilai variabel reaktif
          TextField(
            onChanged:
                rc.changeName, // Menghubungkan perubahan teks ke controller
            decoration: InputDecoration(
              labelText: "Enter name", // Label input
              border: OutlineInputBorder(), // Gaya border
            ),
          ),
        ],
      ),
    );
  }
}
