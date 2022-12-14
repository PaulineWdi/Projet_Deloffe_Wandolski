class Recipe {
  final String name;
  final String images;
  final String rating;
  final String totalTime;

  Recipe({this.name, this.images, this.rating, this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['Title'] as String,
        images: json['Poster'] as String,
        rating: json['Year'] as String,
        totalTime: json['Type'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}