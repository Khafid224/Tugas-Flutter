import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// Controller dengan penggunaan "worker" dari GetX
class WorkerController extends GetxController {
  // Variabel reaktif
  var count = 0.obs;

  @override
  void onInit() {
    // Worker akan dipanggil ketika variabel "count" berubah

    // Dipanggil setiap kali "count" berubah
    ever(count, (_) => print("ever: Count changed to $count"));

    // Dipanggil hanya sekali ketika "count" berubah untuk pertama kalinya
    once(count, (_) => print("once: Count changed to $count"));

    // Dipanggil setiap interval waktu tertentu jika "count" berubah
    interval(
      count,
      (_) => print("interval: Count changed to $count"),
      time: Duration(seconds: 4), // Interval 4 detik
    );

    super.onInit();
  }

  // Method untuk meningkatkan nilai "count"
  void increment() {
    count++; // Mengubah nilai variabel reaktif
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Worker Example"),
        ),
        body: WorkerExample(),
      ),
    );
  }
}

// Widget yang menggunakan controller untuk mengelola "count"
class WorkerExample extends StatelessWidget {
  final WorkerController wc =
      Get.put(WorkerController()); // Menginisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Menampilkan nilai "count" secara dinamis menggunakan Obx
          Obx(
            () => Text(
              "Count: ${wc.count}",
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 20),
          // Tombol untuk meningkatkan nilai "count"
          ElevatedButton(
            onPressed: wc.increment,
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}
