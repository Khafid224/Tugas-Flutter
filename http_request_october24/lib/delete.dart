import 'dart:convert'; // Digunakan untuk encoding dan decoding JSON.
import 'package:flutter/material.dart'; // Paket Flutter untuk membuat UI.
import 'package:http/http.dart'
    as http; // Paket HTTP untuk melakukan request API.

void main() {
  // Fungsi utama yang akan dijalankan pertama kali.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Widget utama aplikasi Flutter.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan MaterialApp sebagai root dari aplikasi.
    return const MaterialApp(
      home: HomePage(), // Menampilkan widget HomePage.
    );
  }
}

class HomePage extends StatefulWidget {
  // Widget HomePage yang memiliki state dinamis.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "belum ada data"; // Menyimpan data yang akan ditampilkan di UI.

  @override
  Widget build(BuildContext context) {
    // Membuat struktur tampilan halaman.
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP DELETE"), // Judul pada AppBar.
        actions: [
          // Tombol Icon untuk melakukan GET request.
          IconButton(
            onPressed: () async {
              // Melakukan GET request ke API.
              var response =
                  await http.get(Uri.parse("https://reqres.in/api/users/2"));

              // Mengubah data response dari JSON ke Map.
              Map<String, dynamic> mybody = json.decode(response.body);

              // Menampilkan data akun yang diambil dari response.
              setState(() {
                data =
                    "Akun : ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: const Icon(Icons.get_app), // Ikon pada tombol.
          ),
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.all(20), // Memberikan padding pada isi halaman.
        children: [
          Text(data), // Menampilkan data yang disimpan dalam variabel `data`.
          const SizedBox(height: 35), // Memberikan jarak vertikal.
          // Tombol untuk melakukan DELETE request.
          ElevatedButton(
            onPressed: () async {
              // Melakukan DELETE request ke API.
              var response =
                  await http.delete(Uri.parse("https://reqres.in/api/users/2"));

              // Jika status code 204, data berhasil dihapus.
              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil menghapus data"; // Pesan keberhasilan.
                });
              }
            },
            child: const Text("DELETE"), // Label pada tombol.
          ),
        ],
      ),
    );
  }
}
