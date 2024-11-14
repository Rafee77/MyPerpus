import 'package:flutter/material.dart';
import 'package:linking_1/controllers/Book_controller.dart';
import 'package:linking_1/models/Book.dart';
import 'package:linking_1/views/Favoriteview.dart';
import 'package:linking_1/views/Profilview.dart';
import 'package:linking_1/widgets/modal.dart';

class Bookview extends StatefulWidget {
  const Bookview({super.key});

  @override
  State<Bookview> createState() => _BookviewState();
}

class _BookviewState extends State<Bookview> {
  final List<BookModel> books = [
    BookModel(
      id: 1,
      title: 'Pulang',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 28,
      coverPath: 'assets/pulang.jpeg',
    ),
    BookModel(
      id: 2,
      title: 'Pergi',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 53,
      coverPath: 'assets/pergi.jpeg',
    ),
    BookModel(
      id: 3,
      title: 'Pulang Pergi',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 41,
      coverPath: 'assets/pulangpergi.jpeg',
    ),
    BookModel(
      id: 4,
      title: 'Negeri Para Bedebah',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 36,
      coverPath: 'assets/parabedebah.jpg',
    ),
    BookModel(
      id: 5,
      title: 'Negeri Di Ujung Tanduk',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 100,
      coverPath: 'assets/negeri.jpg',
    ),
    BookModel(
      id: 6,
      title: 'Bedebah Di Ujung Tanduk',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 78,
      coverPath: 'assets/bedebahtanduk.jpg',
    ),
    BookModel(
      id: 7,
      title: 'Tanah Para Bandit',
      author: 'Tere Liye',
      publisher: 'SABAKGRIP',
      voteAverage: 63,
      coverPath: 'assets/tanahbandit.png',
    ),
  ];

  List<BookModel> filteredBooks = [];
  List<BookModel> favoriteBooks = [];
  String searchQuery = '';
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredBooks = books.where((book) {
        return book.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void addToFavorites(BookModel book) {
    setState(() {
      if (!favoriteBooks.contains(book)) {
        favoriteBooks.add(book);
      }
    });
  }

  void removeFromFavorites(BookModel book) {
    setState(() {
      favoriteBooks.remove(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildHomePage(),
      Favview(
        favoriteBooks: favoriteBooks,
        onRemove: removeFromFavorites,
      ),
      const Profilview(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MYPERPUS'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profil',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildHomePage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: updateSearchQuery,
            decoration: const InputDecoration(
              labelText: 'Cari Buku',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemCount: filteredBooks.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (favoriteBooks.contains(filteredBooks[index])) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${filteredBooks[index].title} sudah ada di favorit!'),
                      ),
                    );
                  } else {
                    addToFavorites(filteredBooks[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '${filteredBooks[index].title} ditambahkan ke favorit!'),
                      ),
                    );
                  }
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Image.asset(
                          filteredBooks[index].coverPath,
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filteredBooks[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                      Text('Penulis: ${filteredBooks[index].author}'),
                      Text('Penerbit: ${filteredBooks[index].publisher}'),
                      Text('Rating: ${filteredBooks[index].voteAverage}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
