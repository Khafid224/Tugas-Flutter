import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// Controller untuk manajemen state
class MyController extends GetxController {
  var message = 'Hello, GetX!'.obs;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/', // Rute awal aplikasi
      getPages: [
        GetPage(
          name: '/', // Nama rute
          page: () => HomePage(), // Halaman yang akan dirender
          binding: BindingsBuilder(() {
            // Menginisialisasi dependency secara otomatis
            Get.put(MyController());
          }),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bindings Builder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              // Menggunakan Obx untuk mereaktifkan perubahan pada message
              final controller = Get.find<MyController>();
              return Text(controller.message.value,
                  style: TextStyle(fontSize: 24));
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mengubah nilai message di controller
                Get.find<MyController>().message.value =
                    "Hello from another page!";
              },
              child: Text("Update Message"),
            ),
          ],
        ),
      ),
    );
  }
}
