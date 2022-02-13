import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/models/picture.dart';
import 'package:wallpaper_ground/photopage.dart';
import 'package:wallpaper_ground/services/apimanager.dart';
import 'package:wallpaper_ground/services/criudentials.dart';
import 'package:wallpaper_ground/widgets/wallpapers.dart';

class ShowAllWallpapers extends StatefulWidget {
  final String categname;
  const ShowAllWallpapers({Key? key, required this.categname})
      : super(key: key);

  @override
  State<ShowAllWallpapers> createState() => _ShowAllWallpapersState();
}

class _ShowAllWallpapersState extends State<ShowAllWallpapers> {
  List<PhotosModel> categoriesWallpaper = [];
  int noOfImageToLoad = 1;

  getCategorieWallpaper() async {
    await http.get(
        Uri.parse(
            "${crid.baseurl}/search?query=${widget.categname}&per_page=15&page=$noOfImageToLoad"),
        headers: {"Authorization": crid.apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        categoriesWallpaper.add(photosModel);
      });

      setState(() {});
    });
  }

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    getCategorieWallpaper();
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageToLoad = noOfImageToLoad + 1;
        getCategorieWallpaper();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("All Wallpares"),
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
      body: SafeArea(
        child: GridView.count(
          controller: _scrollController,
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          children: List.generate(categoriesWallpaper.length, (index) {
            return Newwalpapers(
              uri: categoriesWallpaper[index].src!.portrait.toString(),
              onclick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoShowPage(
                              uri: categoriesWallpaper[index]
                                  .src!
                                  .portrait
                                  .toString(),
                            )));
              },
            );
          }),
        ),
      ),
    );
  }
}
