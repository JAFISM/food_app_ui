import 'dart:ui';

class PopularModel {
  String name, iconPath, level, duration, calories;
  bool viewSelected;
  Color bgcolor;

  PopularModel(
      {required this.name,
        required this.iconPath,
        required this.duration,
        required this.calories,
        required this.level,
        required this.bgcolor,
        required this.viewSelected});

  static List<PopularModel> getpopDiets() {
    List<PopularModel>populardiets = [];

   populardiets.add(PopularModel(
        name: "Cake",
        iconPath: "assets/icons/pudding-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor: const Color(0xffC58BF2),
        viewSelected: true));

   populardiets.add(PopularModel(
        name: "Pizza",
        iconPath: "assets/icons/pizza-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor:const Color(0xff92A3FD) ,
        viewSelected: false));
   populardiets.add(PopularModel(
        name: "Packages",
        iconPath: "assets/icons/fast-food-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        level: "Easy",
        bgcolor: const Color(0xffC58BF2),
        viewSelected: false));
    populardiets.add(PopularModel(
        name: "Burger",
        iconPath: "assets/icons/fast-food-burger-svgrepo-com.svg",
        duration: "20mins",
        calories: "230kcal",
        bgcolor: const Color(0xff92A3FD),
        level: "Easy",
        viewSelected: false));
    return populardiets;
  }
}
