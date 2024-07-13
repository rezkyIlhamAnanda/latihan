import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_16_mei/30Maret_6April/model/model_berita.dart';
import 'package:latihan_16_mei/30Maret_6April/screen_page/detail_berita.dart';
import 'package:latihan_16_mei/30Maret_6April/screen_page/page_login_api.dart';
import 'package:latihan_16_mei/PraUTSRezky/utils/sessions_manager.dart';

class PageListBerita extends StatefulWidget {
  const PageListBerita({super.key});

  @override
  State<PageListBerita> createState() => _PageListBeritaState();
}

class _PageListBeritaState extends State<PageListBerita> {
  // Method untuk mendapatkan berita
  Future<List<Datum>?> getBerita() async {
    try {
      // Berhasil
      http.Response response = await http.get(Uri.parse("http://192.168.100.137/beritaDb/getBerita.php"));
      return modelBeritaFromJson(response.body).data;
      // Kondisi gagal untuk mendapatkan respon API
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  String? username;

  // Untuk mendapatkan data sesi
  Future getDataSession() async {
    await Future.delayed(const Duration(seconds: 1), () {
      session.getSession().then((value) {
        print('data sesi .. ' + value.toString());
        username = session.userName;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    session.getSession();
    getDataSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Berita'),
        backgroundColor: Colors.cyan,
        actions: [
          TextButton(onPressed: () {}, child: Text('Hi ... ${session.userName}')),
          // Logout
          IconButton(
            onPressed: () {
              // Clear session
              setState(() {
                session.clearSession();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PageLoginApi()),
                      (route) => false,
                );
              });
            },
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Logout',
          )
        ],
      ),
      body: FutureBuilder<List<Datum>?>(
        future: getBerita(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Datum? data = snapshot.data?[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailBeritaPage(data: data), // Mengirimkan data ke halaman detail
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://192.168.100.137/beritaDb/gambar_berita/${data?.gambarBerita}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '${data?.judul}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              '${data?.isiBerita}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }
}
