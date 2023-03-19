import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_ui/pages/diet_model.dart';
import 'package:food_app_ui/pages/popular_model.dart';

import 'category_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularModel> populardiets = [];

  void _getinitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    populardiets = PopularModel.getpopDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getinitialInfo();
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          SizedBox(
            height: 40,
          ),
          _popularSection(),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Popular",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20,),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                     // padding: EdgeInsets.only(left: 20,right: 20),
                      height: 100,
                      decoration: BoxDecoration(
                        color: populardiets[index].viewSelected?
                        Color(0xffC58BF2).withOpacity(0.3):Colors.blueGrey.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              child: SvgPicture.asset(populardiets[index].iconPath,height: 50,width: 50,),
                            onTap: (){},
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(populardiets[index].name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                              Text(populardiets[index].level+" | "+populardiets[index].duration+" | "+populardiets[index].calories,
                                style: TextStyle(color: Color(0xff7B6F72),fontWeight: FontWeight.w500,fontSize: 16),)
                            ],
                          ),
                          FloatingActionButton.small(
                            onPressed: (){},
                            backgroundColor:Color(0xff9DCEFF),
                            child: Icon(Icons.arrow_forward_ios,),
                          )
                          // CircleAvatar(
                          //   backgroundColor: Color(0xff9DCEFF),
                          //     child: Icon(Icons.arrow_forward_ios,
                          //       color: Colors.white ,
                          //     ))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: populardiets.length)
          ],
        );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation \nfor Diets",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          //color: Colors.blue,
          height: 240,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].bgcolor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        diets[index].iconPath,
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        diets[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      Text(
                        diets[index].level +
                            ' | ' +
                            diets[index].duration +
                            ' | ' +
                            diets[index].calories,
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(colors: [
                              diets[index].viewSelected
                                  ? Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewSelected
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,
                            ]),
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                  color: diets[index].viewSelected
                                      ? Colors.white
                                      : Color(0xffC58BF2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemCount: diets.length),
        ),
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          //color: Colors.greenAccent,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) => Container(
              width: 100,
              decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        categories[index].iconPath,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                "assets/icons/icons8-search ios.svg",
                height: 15,
              ),
            ),
            hintText: 'Search Pancake..',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                "assets/icons/settings-sliders.svg",
                height: 5,
                width: 5,
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/angle-left.svg",
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              "assets/icons/menu-svgrepo-com.svg",
              height: 30,
              width: 30,
            ),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
