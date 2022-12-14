import 'package:flutter/material.dart';
import 'package:film/models/recipe.api.dart';
import 'package:film/models/recipe.dart';
import 'package:film/views/widgets/recipe_card.dart';

import 'CustomSearchDelegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  String get title => "API FILM";

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;
  String value;
  String selectedPlace = '';

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(selectedPlace);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate()
                );
              },
              icon: const Icon(Icons.search),
            ),
            // selectedPlace == ''
            //   ? Container()
            //   : Container(
            //   child: Text(
            //     selectedPlace
            //   ),
            // ),
             Expanded(
               child: ListView.builder(
                  itemCount: _recipes.length,
                   itemBuilder: (context , index) {
                     return const ListTile(
                  );
                },
               )
            ),

            ],
          ),

        body:
            _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      year: _recipes[index].totalTime,
                      type: _recipes[index].rating.toString(),
                      poster: _recipes[index].images);
                  },
              )
        );
    }
}


