import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallpaper_ground/category.dart';
import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/models/category.dart';
import 'package:wallpaper_ground/models/picture.dart';

import 'package:wallpaper_ground/photopage.dart';
import 'package:wallpaper_ground/services/apimanager.dart';
import 'package:wallpaper_ground/services/criudentials.dart';
import 'package:wallpaper_ground/showwallpapers.dart';
import 'package:wallpaper_ground/widgets/customcategory.dart';
import 'package:wallpaper_ground/widgets/custominput.dart';
import 'package:wallpaper_ground/widgets/wallpapers.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = [];
  List<PhotosModel> categoriesWallpaper = [];

  int noOfImageToLoad = 1;
  List<PhotosModel> photos = [];

  getTrendingWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=10&page=$noOfImageToLoad"),
        headers: {"Authorization": crid.apiKEY}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  TextEditingController searchController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    getTrendingWallpaper();
    categories = getCategories();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageToLoad = noOfImageToLoad + 1;
        getTrendingWallpaper();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Wallpaper Ground"),
          titleTextStyle:
              Constants.heading2.copyWith(color: Constants.Secandory),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: custominput(
                          hinttxt: "Search Wallpaper...",
                          ispassword: false,
                          icc: IconButton(
                            onPressed: () {
                              String name = searchController.text
                                  .toLowerCase()
                                  .replaceAll(' ', '');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShowAllWallpapers(categname: name)));
                            },
                            icon: Icon(Icons.search),
                          ),
                          conto: searchController,
                          ontap: () {}),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: Constants.heading1,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoriesShow(categories: categories)));
                        },
                        child: Text("See All", style: Constants.regular1))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomCategory(
                        image: categories[index].imgUrl.toString(),
                        text: categories[index].categorieName.toString(),
                        onclick: () {
                          String name = categories[index]
                              .categorieName!
                              .toLowerCase()
                              .replaceAll(' ', '');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShowAllWallpapers(categname: name)));
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Trending Wallpapers",
                    style: Constants.heading3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.count(
                    controller: _scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    children: List.generate(photos.length, (index) {
                      return Newwalpapers(
                        uri: photos[index].src!.portrait.toString(),
                        onclick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoShowPage(
                                        uri: photos[index]
                                            .src!
                                            .portrait
                                            .toString(),
                                      )));
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
