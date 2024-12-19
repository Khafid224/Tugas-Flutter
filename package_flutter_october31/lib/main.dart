import 'package:flutter/material.dart'; // Paket Flutter untuk membuat UI.
import './pages/home.dart'; // Mengimpor file `home.dart` yang berada di folder `pages`.

void main() {
  // Fungsi utama yang akan dijalankan pertama kali oleh aplikasi.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Widget utama aplikasi Flutter yang bersifat statis (tidak memiliki state).
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membangun UI aplikasi menggunakan MaterialApp.
    return MaterialApp(
      home:
          HomePage(), // Menentukan widget HomePage sebagai halaman utama aplikasi.
    );
  }
}
