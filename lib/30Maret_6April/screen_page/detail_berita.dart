import 'package:flutter/material.dart';
import 'package:latihan_16_mei/30Maret_6April/model/model_berita.dart';

class DetailBeritaPage extends StatelessWidget {
  final Datum? data;

  const DetailBeritaPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data?.judul ?? "Detail Berita"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data?.judul ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(data?.isiBerita ?? ''),
            SizedBox(height: 16),
            data?.gambarBerita != null
                ? Image.network('http://192.168.100.137/beritaDb/gambar_berita/${data?.gambarBerita}')
                : Container(),
          ],
        ),
      ),
    );
  }
}
