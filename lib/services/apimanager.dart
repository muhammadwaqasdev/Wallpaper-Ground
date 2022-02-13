import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ground/models/category.dart';
import 'package:wallpaper_ground/models/picture.dart';
import 'package:wallpaper_ground/services/criudentials.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

// Future<PhotosModel> getSearchWallpaper(String searchQuery) async {
//   PhotosModel photosModel = PhotosModel();
//   await http.get(
//       Uri.parse("${crid.baseurl}/search?query=$searchQuery&per_page=30&page=1"),
//       headers: {"Authorization": crid.apiKEY}).then((value) {
//     print(value.body);

//     Map<String, dynamic> jsonData = jsonDecode(value.body);
//     jsonData["photos"].forEach((element) {
//       print(element);
//       photosModel = PhotosModel.fromMap(element);
//       print(
//           photosModel.toString() + "  " + photosModel.src!.portrait.toString());
//     });

//     return photosModel;
//   });
//   return photosModel;
// }

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = [];
  CategorieModel categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Street Art";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "City";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.categorieName = "Motivation";

  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Bikes";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Cars";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  return categories;
}

Future<PhotosModel> getCategorieWallpaper(String categorie) async {
  PhotosModel photosModel = new PhotosModel();
  await http.get(
      Uri.parse("${crid.baseurl}/search?query=$categorie&per_page=30&page=1"),
      headers: {"Authorization": crid.apiKEY}).then((value) {
    //print(value.body);

    Map<String, dynamic> jsonData = jsonDecode(value.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      photosModel = PhotosModel.fromMap(element);
      //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
    });

    return photosModel;
  });
  return photosModel;
}

// Future<PhotosModel> getTrendingWallpaper(int noOfImageToLoad) async {
//   PhotosModel photosModel = new PhotosModel();
//   await http.get(
//       Uri.parse(
//           "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1"),
//       headers: {"Authorization": crid.apiKEY}).then((value) {
//     //print(value.body);

//     Map<String, dynamic> jsonData = jsonDecode(value.body);
//     jsonData["photos"].forEach((element) {
//       //print(element);
//       photosModel = PhotosModel.fromMap(element);
//       //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
//     });

//     return photosModel;
//   });
//   return photosModel;
// }

Future<bool> updatehomescreen(String uri) async {
  int location = WallpaperManager.HOME_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(uri);
  String result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return false;
}

Future<bool> updatelockscreen(String uri) async {
  int location = WallpaperManager.LOCK_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(uri);
  String result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return false;
}

Future<bool> updatebothscreen(String uri) async {
  int location = WallpaperManager.BOTH_SCREENS;
  var file = await DefaultCacheManager().getSingleFile(uri);
  String result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return false;
}
