import 'dart:convert';

class MovieItems {
  final List<Data> data;
  final String imdbRating;
  final String? rottenRating;
  final String doubanRating;
  MovieItems({
    required this.data,
    required this.imdbRating,
    required this.rottenRating,
    required this.doubanRating,
  });

  factory MovieItems.fromMap(Map<String, dynamic> map) {
    return MovieItems(
      data: List<Data>.from(
        (map['data'] as List).map<Data>((x) => Data.fromMap(x)),
      ),
      imdbRating: map['imdbRating'] as String,
      rottenRating: map['rottenRating'] as String?,
      doubanRating: map['doubanRating'] as String,
    );
  }

  factory MovieItems.fromJson(String source) =>
      MovieItems.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Data {
  final String poster;
  final String name;
  final String genre;
  final String description;
  final String country;
  Data({
    required this.poster,
    required this.name,
    required this.genre,
    required this.description,
    required this.country,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      poster: map['poster'] as String,
      name: map['name'] as String,
      genre: map['genre'] as String,
      description: map['description'] as String,
      country: map['country'] as String,
    );
  }

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);
}
