import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/', // Rute awal aplikasi
      getPages: [
        GetPage(name: '/', page: () => HomePage()), // Rute untuk HomePage
        GetPage(
            name: '/second', page: () => SecondPage()), // Rute untuk SecondPage
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route Named Dengan GetX")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman kedua menggunakan rute bernama
            Get.toNamed('/second');
          },
          child: Text("Pindah ke Halaman 2"),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman ke 2")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya
            Get.back();
          },
          child: Text("Kembali ke Halaman 1"),
        ),
      ),
    );
  }
}
