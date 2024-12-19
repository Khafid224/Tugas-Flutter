import 'package:flutter/material.dart';

// Fungsi utama yang menjalankan aplikasi Flutter
void main() {
  runApp(const MyApp()); // Menjalankan widget MyApp sebagai root aplikasi
}

// Widget MyApp yang bersifat Stateful karena nilai akan berubah-ubah
class MyApp extends StatefulWidget {
  const MyApp({super.key}); // Constructor dengan key opsional

  @override
  State<MyApp> createState() =>
      _MyAppState(); // Menghubungkan dengan state _MyAppState
}

// State untuk widget MyApp
class _MyAppState extends State<MyApp> {
  int nilai = 0; // Variabel untuk menyimpan nilai angka yang akan diubah

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Increment Apps"), // Judul aplikasi di AppBar
        centerTitle: true, // Menengahkan judul di AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Konten berada di tengah layar secara vertikal
          children: [
            Text(
              "$nilai", // Menampilkan nilai saat ini
              style: const TextStyle(
                fontSize: 50, // Ukuran font besar untuk nilai
              ),
            ),
            const SizedBox(height: 20), // Jarak antara nilai dan tombol
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Menyebarkan tombol secara merata
              children: [
                ElevatedButton(
                  onPressed: () {
                    nilai = nilai - 1; // Mengurangi nilai dengan 1
                    print(nilai); // Menampilkan nilai di console
                    setState(
                        () {}); // Memperbarui tampilan setelah nilai berubah
                  },
                  child: const Icon(Icons.remove), // Ikon minus pada tombol
                ),
                ElevatedButton(
                  onPressed: () {
                    nilai = nilai + 1; // Menambahkan nilai dengan 1
                    print(nilai); // Menampilkan nilai di console
                    setState(
                        () {}); // Memperbarui tampilan setelah nilai berubah
                  },
                  child: const Icon(Icons.add), // Ikon plus pada tombol
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
