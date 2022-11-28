import 'film.dart';
import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;

class Film_api {
  static Future<List<Film>> getFilm() async {
    // var uri = Uri.https("https://omdbapi.com/s=star&apikey=91fdcc20%22);
    final uri = Uri.parse('https://omdbapi.com/?apikey=91fdcc20&s=avengers%27');

        http.Response response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['Search']) {
      _temp.add(i);
    }

    return Film.FilmFromSnapshot(_temp);
  }
}