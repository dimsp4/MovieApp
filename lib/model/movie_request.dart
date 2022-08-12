import 'dart:convert';

import 'package:http/http.dart' as http;

class Movie {
  int? id;
  String? backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;
  bool? adult;
  num? rating;
  int? genre;

  Movie({
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.rating,
    this.releaseDate,
    this.title,
    this.genre,
  });
}

Future<List<Movie>> getRequest() async {
  //replace your restFull API here.
  String url =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=cce490f9e575d63a600bb9b3dc9971fc&language=en-US&page=1";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['results'];

  //Creating a list to store input data;
  List<Movie> datas = [];
  for (var movie in responseData) {
    Movie data = Movie(
      id: movie['id'],
      adult: movie['adult'],
      backdropPath: movie['backdrop_path'],
      originalLanguage: movie['original_language'],
      originalTitle: movie['original_title'],
      overview: movie['overview'],
      posterPath: movie['poster_path'],
      rating: movie['vote_average'],
      releaseDate: movie['release_date'],
      title: movie['title'],
    );

    //Adding user to the list.
    datas.add(data);
  }
  return datas;
}

Future<List<Movie>> getGenre(String id) async {
  //replace your restFull API here.
  String url =
      "https://api.themoviedb.org/3/discover/movie?api_key=cce490f9e575d63a600bb9b3dc9971fc&language=en-US&with_genres=$id";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['results'];

  //Creating a list to store input data;
  List<Movie> datas = [];
  for (var movie in responseData) {
    Movie data = Movie(
      id: movie['id'],
      adult: movie['adult'],
      backdropPath: movie['backdrop_path'],
      originalLanguage: movie['original_language'],
      originalTitle: movie['original_title'],
      overview: movie['overview'],
      posterPath: movie['poster_path'],
      rating: movie['vote_average'],
      releaseDate: movie['release_date'],
      title: movie['title'],
    );

    //Adding user to the list.
    datas.add(data);
  }
  return datas;
}

Future<List<Movie>> getPopular() async {
  //replace your restFull API here.
  String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=cce490f9e575d63a600bb9b3dc9971fc&language=en-US&page=1";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['results'];

  //Creating a list to store input data;
  List<Movie> datas = [];
  for (var movie in responseData) {
    Movie data = Movie(
      id: movie['id'],
      adult: movie['adult'],
      backdropPath: movie['backdrop_path'],
      originalLanguage: movie['original_language'],
      originalTitle: movie['original_title'],
      overview: movie['overview'],
      posterPath: movie['poster_path'],
      rating: movie['vote_average'],
      releaseDate: movie['release_date'],
      title: movie['title'],
    );

    //Adding user to the list.
    datas.add(data);
  }
  return datas;
}

Future<List<Movie>> getSearch(String search) async {
  //replace your restFull API here.
  String url =
      "https://api.themoviedb.org/3/search/movie?api_key=cce490f9e575d63a600bb9b3dc9971fc&language=en-US&query=$search&page=1&include_adult=false";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['results'];

  //Creating a list to store input data;
  List<Movie> datas = [];
  for (var movie in responseData) {
    Movie data = Movie(
      id: movie['id'],
      adult: movie['adult'],
      backdropPath: movie['backdrop_path'],
      originalLanguage: movie['original_language'],
      originalTitle: movie['original_title'],
      overview: movie['overview'],
      posterPath: movie['poster_path'],
      rating: movie['vote_average'],
      releaseDate: movie['release_date'],
      title: movie['title'],
    );

    //Adding user to the list.
    datas.add(data);
  }
  return datas;
}