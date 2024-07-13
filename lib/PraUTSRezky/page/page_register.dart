import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_16_mei/PraUTSRezky/model/model_register.dart';
import 'package:latihan_16_mei/PraUTSRezky/page/page_login.dart';

class RegisterApi extends StatefulWidget {
  const RegisterApi({super.key});

  @override
  State<RegisterApi> createState() => _RegisterApiState();
}

class _RegisterApiState extends State<RegisterApi> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullname = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;

  Future<ModelRegisterLagi?> registerAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse('http://192.168.158.29/edukasi_server2/register.php'),
        body: {
          "username": txtUsername.text,
          "email": txtEmail.text,
          "password": txtPassword.text,
          "fullname": txtFullname.text,
        },
      );

      if (response.statusCode == 200) {
        final data = modelRegisterLagiFromJson(response.body);
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${data.message}')));
        if (data.value == 1) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PageLoginTugas()),
                (route) => false,
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Form Register'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Tidak boleh kosong" : null,
                  controller: txtUsername,
                  decoration: InputDecoration(
                    hintText: 'Input Username',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Tidak boleh kosong" : null,
                  controller: txtEmail,
                  decoration: InputDecoration(
                    hintText: 'Input Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Tidak boleh kosong" : null,
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Input Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Tidak boleh kosong" : null,
                  controller: txtFullname,
                  decoration: InputDecoration(
                    hintText: 'Input Fullname',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : MaterialButton(
                    onPressed: () {
                      if (keyForm.currentState?.validate() == true) {
                        registerAccount();
                      }
                    },
                    child: Text('Register'),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: Colors.green),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageLoginTugas()));
          },
          child: Text('Anda sudah punya account? Silakan Login'),
        ),
      ),
    );
  }
}
