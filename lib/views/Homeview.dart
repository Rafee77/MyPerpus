import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linking_1/widgets/menu_bottom.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Halaman Home"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("Back to login"),
          ),
        ],
      )),
      bottomNavigationBar: MenuBottom(0),
    );
  }
}
