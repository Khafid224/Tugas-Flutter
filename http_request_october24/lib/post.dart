import 'dart:convert'; // Digunakan untuk melakukan encoding dan decoding data JSON.
import 'package:flutter/material.dart'; // Paket Flutter untuk UI.
import 'package:http/http.dart'
    as http; // Paket HTTP untuk mengirimkan permintaan HTTP.

void main() {
  // Fungsi utama yang dijalankan saat aplikasi dimulai.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Widget utama aplikasi.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah root aplikasi Flutter.
    return const MaterialApp(
      home: HomePage(), // Menampilkan halaman awal HomePage.
    );
  }
}

class HomePage extends StatefulWidget {
  // Halaman utama yang memungkinkan state dinamis.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller untuk TextField.
  TextEditingController nameC =
      TextEditingController(); // Controller untuk input nama.
  TextEditingController jobC =
      TextEditingController(); // Controller untuk input pekerjaan.

  String hasilResponse =
      "Belum ada Data"; // Variabel untuk menampilkan hasil respons POST.

  @override
  Widget build(BuildContext context) {
    // Membuat antarmuka pengguna.
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP POST"), // Judul pada AppBar.
      ),
      body: ListView(
        padding:
            const EdgeInsets.all(20), // Memberikan padding pada isi halaman.
        children: [
          // TextField untuk input nama.
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text, // Tipe input berupa teks.
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name", // Label pada TextField.
            ),
          ),
          const SizedBox(
            height: 15, // Jarak vertikal.
          ),
          // TextField untuk input pekerjaan.
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text, // Tipe input berupa teks.
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "job", // Label pada TextField.
            ),
          ),
          const SizedBox(height: 15), // Jarak vertikal.
          // Tombol untuk mengirimkan data.
          ElevatedButton(
            onPressed: () async {
              // Permintaan POST ke API.
              var myresponse = await http.post(
                Uri.parse("https://reqres.in/api/users"), // URL API tujuan.
                body: {
                  "name": nameC.text,
                  "job": jobC.text
                }, // Data yang dikirimkan.
              );

              // Decode respons JSON menjadi Map.
              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              // Perbarui state dengan data respons.
              setState(() {
                hasilResponse =
                    "${data['name']} - ${data['job']}"; // Menampilkan data yang diterima.
              });
            },
            child: const Text("SUBMIT"), // Label tombol.
          ),
          const SizedBox(height: 50), // Jarak vertikal.
          const Divider(
            color: Colors.black, // Garis pemisah.
          ),
          const SizedBox(height: 10), // Jarak vertikal.
          // Menampilkan hasil respons dari API.
          Text(hasilResponse),
        ],
      ),
    );
  }
}
