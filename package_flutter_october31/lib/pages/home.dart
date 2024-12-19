import 'package:convex_bottom_bar/convex_bottom_bar.dart'; // Paket untuk membuat bottom navigation bar dengan gaya menarik.
import 'package:flutter/material.dart'; // Paket Flutter untuk membangun UI.
import 'package:faker/faker.dart'; // Paket untuk membuat data palsu (mock data).
import 'package:intl/intl.dart'; // Paket untuk format tanggal/waktu.

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker(); // Objek untuk menghasilkan data palsu.

  String tanggal = DateTime.now()
      .toIso8601String(); // Menyimpan tanggal saat ini dalam format ISO8601.
  int currentIndex =
      0; // Indeks untuk menentukan halaman yang sedang aktif di bottom navigation bar.

  @override
  Widget build(BuildContext context) {
    // Daftar widget yang akan ditampilkan berdasarkan `currentIndex`.
    List<Widget> widgets = [
      // Halaman pertama (Home) menampilkan daftar list dengan data palsu.
      ListView.builder(
        itemCount: 50, // Menentukan jumlah item dalam daftar.
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(
                "https://picsum.photos/id/${870 + index}/200/300"), // Mengambil gambar dari API Picsum.
          ),
          title:
              Text("${faker.person.name()}"), // Nama palsu menggunakan Faker.
          subtitle: Text(
            "${DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(tanggal))}", // Format tanggal menggunakan Intl.
          ),
        ),
      ),
      Center(
        child: Text("MENU KE 2"), // Halaman kedua dengan teks sederhana.
      ),
      Center(
        child: Text("MENU KE 3"), // Halaman ketiga.
      ),
      Center(
        child: Text("MENU KE 4"), // Halaman keempat.
      ),
      Center(
        child: Text("MENU KE 5"), // Halaman kelima.
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("FAKER"), // Judul di AppBar.
      ),
      body: widgets[
          currentIndex], // Menampilkan widget sesuai dengan `currentIndex`.
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react, // Gaya reaktif untuk ConvexAppBar.
        backgroundColor: Colors.red[900], // Warna latar belakang merah tua.
        items: [
          // Item menu di bottom navigation bar.
          TabItem(icon: Icons.home, title: 'Home'), // Tab pertama.
          TabItem(icon: Icons.map, title: 'Discovery'), // Tab kedua.
          TabItem(icon: Icons.add, title: 'Add'), // Tab ketiga.
          TabItem(icon: Icons.message, title: 'Message'), // Tab keempat.
          TabItem(icon: Icons.people, title: 'Profile'), // Tab kelima.
        ],
        initialActiveIndex: 0, // Indeks awal saat aplikasi dimulai.
        onTap: (int i) {
          // Mengubah `currentIndex` sesuai dengan tab yang ditekan.
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
