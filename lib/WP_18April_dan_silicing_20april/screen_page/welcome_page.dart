import 'package:flutter/material.dart';
import 'package:latihan_16_mei/WP_18April_dan_silicing_20april/screen_page/login_page.dart';
import 'package:latihan_16_mei/WP_18April_dan_silicing_20april/screen_page/register_page.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('gambar/background.jpeg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image(
                    image: AssetImage('gambar/logo_udaskin.png'),
                    height: 55,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PageLogin(),
                            ),
                          );
                        },
                        child: Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PageRegister(),
                            ),
                          );
                        },
                        child: Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff333333),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color(0xffF2F2F2),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60,),

                    ],
                  )
                ],
              ),
            ),


          ],
        )
    );
  }
}