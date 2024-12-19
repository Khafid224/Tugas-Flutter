import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// Controller untuk manajemen state
class MyController extends GetxController {
  // Variabel reaktif untuk counter
  var counter = 0.obs;

  // Fungsi untuk meningkatkan nilai counter
  void increment() {
    counter++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menyediakan controller menggunakan Get.put()
    Get.put(MyController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Manajemen Dependency dengan GetX")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget Obx untuk merender ulang saat data reaktif berubah
              Obx(() {
                return Text(
                  "Counter: ${Get.find<MyController>().counter}",
                  style: TextStyle(fontSize: 24),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  // Memanggil method increment dari controller
                  Get.find<MyController>().increment();
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
