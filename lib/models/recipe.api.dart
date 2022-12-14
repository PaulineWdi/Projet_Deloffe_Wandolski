import 'dart:convert';
import 'package:film/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe(String nomfilm) async {
    //final uri = Uri.parse('https://omdbapi.com/?apikey=91fdcc20&s=iron-man%27');
    final uri = Uri.parse('https://omdbapi.com/?apikey=91fdcc20&s=+$nomfilm%27');

    http.Response response = await http.get(uri);
    //var uri = Uri.https('https://omdbapi.com/?apikey=91fdcc20&s=avengers%27',);

    //final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['Search']) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
