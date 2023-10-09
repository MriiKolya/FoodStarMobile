// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_this

class DishModel {
  int _index = 0;
  final String author;
  final num price;
  final String author_image;
  final String dish_image;
  final String categoriesDish;
  final String ingredients;
  final String title;
  final String calories;
  final String weight;
  final String add_information;
  final bool new_Dish;
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;
  int get index => _index;

  set isFavorite(bool value) {
    _isFavorite = value;
  }

  set index(int value) {
    _index = value;
  }

  @override
  String toString() {
    return 'DishModel(author: $author, title: $title)';
  }

  DishModel.copy(DishModel original)
      : this.calories = original.calories,
        this.weight = original.weight,
        this.new_Dish = original.new_Dish,
        this.add_information = original.add_information,
        this.author = original.author,
        this.categoriesDish = original.categoriesDish,
        this.ingredients = original.ingredients,
        this.author_image = original.author_image,
        this.dish_image = original.dish_image,
        this.price = original.price,
        this.title = original.title;
  DishModel(
      {required this.calories,
      required this.weight,
      required this.new_Dish,
      required this.add_information,
      required this.author,
      required this.categoriesDish,
      required this.ingredients,
      required this.author_image,
      required this.dish_image,
      required this.price,
      required this.title});

  static DishModel fromJson(Map<String, dynamic> json) {
    return DishModel(
      categoriesDish: _capitalize(json['categories'].toString().toLowerCase()),
      ingredients: json['Ingredients'],
      author: json['author'],
      weight: json['weight'],
      new_Dish: json['new_Dish'],
      author_image: json['author_image'],
      add_information: json['add_information'],
      dish_image: json['dish_image'],
      price: json['price'],
      calories: json['calories'],
      title: _capitalize(json['title'].toString().toLowerCase()),
    );
  }

  static String _capitalize(String str) {
    return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
  }
}
