import 'package:flutter/material.dart';
import 'package:linking_1/views/Bookview.dart';
import 'package:linking_1/views/Favoriteview.dart';
import 'package:linking_1/views/Homeview.dart';
import 'package:linking_1/views/Loginview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => Loginview(),
        '/': (_) => Homeview(),
        '/transaksi': (_) => Favview(
              favoriteBooks: [],
              onRemove: (p0) {},
            ),
        // '/profil': (_) => Profilview(),
        '/movie': (_) => Bookview(),
      },
    );
  }
}
