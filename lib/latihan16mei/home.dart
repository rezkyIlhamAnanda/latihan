import 'package:flutter/material.dart';
import 'package:latihan_16_mei/latihan16mei/akses_kamera.dart';
import 'package:latihan_16_mei/latihan16mei/maps_flutter.dart';

class PageAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan 16 Mei'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AksesKamera()),
                  );
                },
                child: Text('Button 1'),
              ),
              SizedBox(height: 20), // Spacer
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>MapsFlutter()),
                  );
                  // Handle button 2 press
                  print('Button 2 pressed');
                },
                child: Text('Button 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}