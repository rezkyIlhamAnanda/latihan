import 'package:flutter/material.dart';

import 'detail_grid.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});
  @override
  State<CustomeGrid> createState() => _CustomeGridState();
}
class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "Petualangan Sherina 2",
      "gambar": "movie1.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Jalan Jauh Jangan Lupa Pulang",
      "gambar": "movie2.jpeg",
      "harga": 35000,
    },
    {
      "judul": "Warkop DKI Reborn",
      "gambar": "movie3.jpeg",
      "harga": 50000,
    },
    {
      "judul": "Ada Apa Dengan Cinta",
      "gambar": "movie4.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Minions",
      "gambar": "movie5.jpeg",
      "harga": 35000,
    },
    {
      "judul": "Agak Laen",
      "gambar": "movie6.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Soul",
      "gambar": "movie7.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Start Up",
      "gambar": "movie8.jpeg",
      "harga": 35000,
    },
    {
      "judul": "The First Responden",
      "gambar": "movie9.jpeg",
      "harga": 50000,
    },
    {
      "judul": "Little Women",
      "gambar": "movie10.jpeg",
      "harga": 45000,
    },
    {
      "judul": "Bride To Terabithia",
      "gambar": "movie11.jpeg",
      "harga": 35000,
    },
    {
      "judul": "Dr. Strange",
      "gambar": "movie12.jpeg",
      "harga": 45000,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Grid"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        itemCount: listMovie.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          // Mengambil judul film
          String title = listMovie[index]["judul"];

          // Membuat judul film yang dipotong menjadi maksimal 10 karakter dengan menambahkan "..."
          String shortenedTitle = title.length > 22 ? "${title.substring(0, 22)}..." : title;

          return GestureDetector(
            onTap: () {
              // Menampilkan Snackbar dengan judul film yang dipilih
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Anda memilih $title"),
                ),
              );

              // Navigasi ke halaman detail grid
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailGrid(listMovie[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        shortenedTitle, // Menampilkan judul film yang dipendekkan
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Rp. ${listMovie[index]["harga"]}"),
                    ],
                  ),
                ),
                child: Image.asset("gambar/${listMovie[index]["gambar"]}"),
              ),
            ),
          );
        },
      ),
    );
  }
}