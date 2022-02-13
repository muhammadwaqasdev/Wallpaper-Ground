import 'package:flutter/material.dart';

import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/models/category.dart';
import 'package:wallpaper_ground/models/picture.dart';
import 'package:wallpaper_ground/services/apimanager.dart';
import 'package:wallpaper_ground/showwallpapers.dart';
import 'package:wallpaper_ground/widgets/customcategory.dart';

class CategoriesShow extends StatelessWidget {
  List<CategorieModel> categories = [];
  CategoriesShow({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PhotosModel> categoriesWallpaper = [];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("All Categories"),
          titleTextStyle: Constants.heading2,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Constants.Primery,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: List.generate(
              categories.length,
              (index) {
                return CustomCategory(
                  image: categories[index].imgUrl.toString(),
                  text: categories[index].categorieName.toString(),
                  onclick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAllWallpapers(
                                categname: categories[index]
                                    .categorieName
                                    .toString())));
                  },
                );
              },
            ),
          ),
        ));
  }
}
