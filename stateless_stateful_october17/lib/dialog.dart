import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(), // Menunjuk halaman utama aplikasi
    );
  }
}

// Halaman utama aplikasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"), // Judul di AppBar
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Menampilkan dialog saat tombol ditekan
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15), // Membuat sudut dialog melengkung
                ),
                title: const Text("INI JUDUL"), // Judul dialog
                content: const Text(
                    "Ini adalah Deskripsi dialog. Kamu bisa melihatnya disini."), // Isi konten dialog
                actions: [
                  // Tombol tindakan di dialog
                  ElevatedButton(
                      onPressed: () {}, // Tidak ada aksi untuk tombol CANCEL
                      child: const Text("CENCEL")), // Tombol CANCEL
                  ElevatedButton(
                      onPressed: () {}, // Tidak ada aksi untuk tombol OKAY
                      child: const Text("OKAY")), // Tombol OKAY
                ],
              ),
            );
          },
          child: const Text("SHOW DIALOG"), // Teks pada tombol utama
        ),
      ),
    );
  }
}
