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
  // Controller untuk mengambil input teks dari pengguna.
  TextEditingController nameC =
      TextEditingController(); // Controller untuk nama.
  TextEditingController jobC =
      TextEditingController(); // Controller untuk pekerjaan.

  String hasilResponse = "Belum ada Data"; // Menyimpan hasil response dari API.

  @override
  Widget build(BuildContext context) {
    // Membuat struktur tampilan halaman.
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP PUT / PATCH"), // Judul pada AppBar.
      ),
      body: ListView(
        padding:
            const EdgeInsets.all(20), // Memberikan padding pada isi halaman.
        children: [
          // Input field untuk nama.
          TextField(
            controller: nameC, // Mengambil data dari controller.
            autocorrect: false, // Tidak menggunakan autocorrect.
            keyboardType: TextInputType.text, // Tipe input berupa teks.
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // Menampilkan border pada input.
              labelText: "Name", // Label untuk input nama.
            ),
          ),
          const SizedBox(
            height: 15, // Memberikan jarak vertikal.
          ),
          // Input field untuk pekerjaan.
          TextField(
            controller: jobC, // Mengambil data dari controller.
            autocorrect: false, // Tidak menggunakan autocorrect.
            keyboardType: TextInputType.text, // Tipe input berupa teks.
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // Menampilkan border pada input.
              labelText: "job", // Label untuk input pekerjaan.
            ),
          ),
          const SizedBox(height: 15), // Memberikan jarak vertikal.
          // Tombol untuk mengirimkan data ke API menggunakan metode PATCH.
          ElevatedButton(
            onPressed: () async {
              // Mengirimkan request PATCH ke API.
              var myresponse = await http.patch(
                Uri.parse("https://reqres.in/api/users/3"), // URL API tujuan.
                body: {
                  "name": nameC.text, // Mengirimkan data nama.
                  "job": jobC.text, // Mengirimkan data pekerjaan.
                },
              );

              // Mengubah data response dari JSON ke Map.
              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              // Memperbarui UI dengan data yang diterima.
              setState(() {
                hasilResponse =
                    "${data['name']} - ${data['job']}"; // Menampilkan hasil response.
              });
            },
            child: const Text("SUBMIT"), // Label pada tombol.
          ),
          const SizedBox(height: 50), // Memberikan jarak vertikal.
          const Divider(
            color: Colors.black, // Garis pemisah.
          ),
          const SizedBox(height: 10), // Memberikan jarak vertikal.
          // Menampilkan hasil response dari API.
          Text(hasilResponse),
        ],
      ),
    );
  }
}
