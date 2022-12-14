import 'package:film/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  List<Recipe>_recipes;



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          _recipes = '' as List<Recipe>;
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.clear),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Recipe> _recipes;

    return ListView.builder(
      itemCount: _recipes.length,
      itemBuilder: (context, index) {
        RecipeCard(
            title: _recipes[index].name,
            year: _recipes[index].totalTime,
            type: _recipes[index].rating.toString(),
            poster: _recipes[index].images);
        return const ListTile(

        );
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {

    return ListView.builder(
      itemCount: _recipes.length,
      itemBuilder: (context, index) {
        var film = _recipes[index];
        return ListTile(
          onTap: () {

        );
      },
    );
  }
}



//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var film in searchTerms) {
//       if (film.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(film);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [
//       'Iron man',
//       'Spider man',
//       'Divergante',
//       'Arthur et les Minimoys',
//       'Star Wars',
//       'Les Bronzés',
//       'Mission Impossible',
//     ];
//     for (var film in searchTerms) {
//       if (film.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(film);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }
//
//
