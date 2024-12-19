import 'dart:convert'; // Untuk melakukan konversi JSON.
import 'package:flutter/material.dart'; // Paket utama Flutter untuk membuat antarmuka pengguna.
import 'package:http/http.dart'
    as http; // Paket HTTP untuk melakukan permintaan HTTP.

void main() {
  // Fungsi utama yang dijalankan saat aplikasi dimulai.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Widget utama aplikasi.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah root dari aplikasi Flutter.
    return const MaterialApp(
      home: HomePage(), // Mengatur halaman awal ke HomePage.
    );
  }
}

class HomePage extends StatefulWidget {
  // Halaman utama yang memiliki state dinamis.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State untuk menyimpan data yang diambil dari API.
  late String id; // Menyimpan ID pengguna.
  late String email; // Menyimpan email pengguna.
  late String name; // Menyimpan nama pengguna.

  @override
  void initState() {
    // Inisialisasi variabel state.
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Membuat antarmuka pengguna.
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP GET"), // Judul di AppBar.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Posisi widget di tengah layar.
          children: [
            // Menampilkan data ID pengguna.
            Text(
              "ID : $id",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            // Menampilkan data email pengguna.
            Text(
              "EMAIL : $email",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            // Menampilkan data nama pengguna.
            Text(
              "NAME : $name",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15), // Jarak vertikal.
            ElevatedButton(
              // Tombol untuk mengambil data dari API.
              onPressed: () async {
                // Permintaan GET ke API.
                var myresponse =
                    await http.get(Uri.parse("https://reqres.in/api/users/5"));
                if (myresponse.statusCode == 200) {
                  // Jika permintaan berhasil (status 200).
                  print("BERHASIL GET DATA"); // Log keberhasilan.
                  // Decode respons JSON menjadi Map.
                  Map<String, dynamic> data =
                      json.decode(myresponse.body) as Map<String, dynamic>;
                  print(data["data"]); // Cetak data ke konsol.
                  setState(() {
                    // Perbarui state dengan data yang diterima.
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  // Jika permintaan gagal.
                  print("ERROR ${myresponse.statusCode}"); // Log error.
                }
              },
              child: const Text("GET DATA"), // Label tombol.
            ),
          ],
        ),
      ),
    );
  }
}
