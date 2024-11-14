class BookModel {
  int id;
  String title;
  String author;
  String publisher;
  double? voteAverage;
  String coverPath;
  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    this.voteAverage,
    required this.coverPath,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.title == title &&
        other.author == author &&
        other.publisher == publisher &&
        other.voteAverage == voteAverage &&
        other.coverPath == coverPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        publisher.hashCode ^
        voteAverage.hashCode ^
        coverPath.hashCode;
  }
}
