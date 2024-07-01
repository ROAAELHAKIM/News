import 'dart:ui';

class CategorieModel {
  String id;
  String name;
  String image;

  Color color;

  CategorieModel(
      {required this.name,
      required this.id,
      required this.image,
      required this.color});

  static List<CategorieModel> getCategories() {
    return [
      CategorieModel(
          name: "sports",
          id: "sports",
          image: "assets/images/sports.png",
          color: Color(0xFFC91C22)),
      CategorieModel(
          name: "Politics",
          id: "entertainment",
          image: "assets/images/Politics.png",
          color: Color(0xFF003E90)),
      CategorieModel(
          name: "Health",
          id: "health",
          image: "assets/images/health.png",
          color: Color(0xFFED1E79)),
      CategorieModel(
          name: "business ",
          id: "business",
          image: "assets/images/bussines.png",
          color: Color(0xFFCF7E48)),
      CategorieModel(
          name: "Environment",
          id: "general",
          image: "assets/images/environment.png",
          color: Color(0xFF4882CF)),
      CategorieModel(
          name: "Science",
          id: "science",
          image: "assets/images/science.png",
          color: Color(0xFFF2D352)),
    ];
  }
}
