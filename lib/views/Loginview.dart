import 'package:flutter/material.dart';
import 'package:linking_1/views/Profilview.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/perpuslogo.png'),
              width: 300,
            ),
            Container(
                width: 500,
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: userController,
                  obscureText: false,
                  onChanged: (a) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input Username'),
                )),
            Container(
                width: 500,
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: (a) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input Password'),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (userController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Login Gagal'),
                              content: Text(
                                  'Username dan Password tidak boleh kosong'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Ok'),
                                ),
                              ],
                            ));
                  } else {
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
