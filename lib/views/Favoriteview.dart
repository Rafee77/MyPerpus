import 'package:flutter/material.dart';
import 'package:linking_1/models/Book.dart';
import 'package:linking_1/widgets/menu_bottom.dart';

class Favview extends StatefulWidget {
  final List<BookModel> favoriteBooks;
  final Function(BookModel) onRemove;

  const Favview({
    super.key,
    required this.favoriteBooks,
    required this.onRemove,
  });

  @override
  _FavviewState createState() => _FavviewState();
}

class _FavviewState extends State<Favview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Favorit (${widget.favoriteBooks.length})'),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: widget.favoriteBooks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.blueAccent, width: 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        widget.favoriteBooks[index].coverPath,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.favoriteBooks[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'Penulis: ${widget.favoriteBooks[index].author}',
                    style: TextStyle(color: Colors.blueGrey[700]),
                  ),
                  Text(
                    'Penerbit: ${widget.favoriteBooks[index].publisher}',
                    style: TextStyle(color: Colors.blueGrey[700]),
                  ),
                  Text(
                    'Stok: ${widget.favoriteBooks[index].voteAverage}',
                    style: TextStyle(color: Colors.blueGrey[700]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      widget.onRemove(widget.favoriteBooks[index]);
                      setState(() {});
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
