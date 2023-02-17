import 'dart:ui';

class CategoryModel{
  String name,iconPath;
  Color boxColor;
  CategoryModel({required this.name,required this.iconPath,required this.boxColor});

 static List<CategoryModel> getCategories(){
    List<CategoryModel> categories=[];
    categories.add(CategoryModel(
      name: 'Pizza',
      iconPath: "assets/icons/food/pizza-svgrepo-com.svg",
      boxColor: Color(0xffC58BF2),));
    categories.add(
        CategoryModel(
            name: 'Cake',
            iconPath: "assets/icons/food/food-color-pizza-slice-svgrepo-com.svg",
            boxColor: Color(0xff92A3FD)));
    categories.add(
        CategoryModel(
            name: 'Pudding',
            iconPath: "assets/icons/food/pudding-svgrepo-com.svg",
            boxColor: Color(0xffC58BF2)));
    categories.add(
        CategoryModel(
            name: 'Burger',
            iconPath: "assets/icons/food/fast-food-burger-svgrepo-com.svg",
            boxColor: Color(0xff92A3FD)));
    categories.add(
        CategoryModel(
            name: 'Package',
            iconPath:"assets/icons/food/fast-food-svgrepo-com.svg",
            boxColor: Color(0xffC58BF2)));
    return categories;
  }
}