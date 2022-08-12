import 'dart:convert';

import 'package:moviedb2/model/genre.dart';
import 'package:http/http.dart' as http;

class Detail {
  String? poster, title, overview;
  Genre? genre;
  num? rating;
  int? duration;

  Detail({
    this.duration,
    this.genre,
    this.overview,
    this.poster,
    this.rating,
    this.title,
  });
}

Future<Detail> getDetail(String id) async {
    String url =
        "https://api.themoviedb.org/3/movie/$id?api_key=cce490f9e575d63a600bb9b3dc9971fc&language=en-US";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    return Detail(
      genre: Genre.fromJson(responseData['genres'][0]),
      poster: responseData['poster_path'],
      duration: responseData['runtime'],
      overview: responseData['overview'],
      title: responseData['original_title'],
      rating: responseData['vote_average'],
    );
  }