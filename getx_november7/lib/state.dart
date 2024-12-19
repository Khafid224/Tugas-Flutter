import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk GetX state management
class CounterController extends GetxController {
  var counter = 0.obs; // Variabel reaktif menggunakan .obs dari GetX

  void increment() {
    counter++; // Menambah nilai counter
  }
}

// Fungsi utama aplikasi
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menggunakan GetMaterialApp untuk mendukung GetX
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management Example"), // Judul aplikasi
        ),
        body: Column(
          children: [
            StatelessExample(), // Contoh Stateless Widget
            StatefulExample(), // Contoh Stateful Widget
            GetXExample(), // Contoh GetX State Management
          ],
        ),
      ),
    );
  }
}

// Contoh Stateless Widget
class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello from Stateless Widget!"), // Teks tetap tanpa state
    );
  }
}

// Contoh Stateful Widget
class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0; // Variabel untuk menyimpan nilai counter

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'), // Menampilkan nilai counter
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++; // Menambah nilai counter menggunakan StatefulWidget
            });
          },
          child: Text("Increment Stateful"), // Tombol untuk increment counter
        ),
      ],
    );
  }
}

// Contoh GetX State Management
class GetXExample extends StatelessWidget {
  final CounterController c =
      Get.put(CounterController()); // Inisialisasi controller GetX
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text(
            'Counter: ${c.counter}')), // Obx untuk mendengarkan perubahan state reaktif
        ElevatedButton(
          onPressed: c.increment, // Memanggil fungsi increment dari controller
          child: Text(
              "Increment with GetX"), // Tombol untuk increment counter dengan GetX
        ),
      ],
    );
  }
}
