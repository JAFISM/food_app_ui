import 'dart:ui';

class DietModel {
  String name, iconPath, level, duration, calories;
  bool viewSelected;
  Color bgcolor;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.duration,
      required this.calories,
      required this.level,
      required this.bgcolor,
      required this.viewSelected});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: "Cake",
        iconPath: "assets/icons/pudding-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor: Color(0xffC58BF2),
        viewSelected: true));

    diets.add(DietModel(
        name: "Pizza",
        iconPath: "assets/icons/pizza-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor:Color(0xff92A3FD) ,
        viewSelected: false));
    diets.add(DietModel(
        name: "Packages",
        iconPath: "assets/icons/fast-food-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor: Color(0xffC58BF2),
        viewSelected: false));
    diets.add(DietModel(
        name: "Burger",
        iconPath: "assets/icons/fast-food-burger-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        bgcolor: Color(0xff92A3FD),
        level: "Easy",
        viewSelected: false));
    return diets;
  }
}
