import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ground/models/category.dart';
import 'package:wallpaper_ground/models/picture.dart';
import 'package:wallpaper_ground/services/criudentials.dart';

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
      "https://images.pexels.com/photos/5011647/pexels-photo-5011647.jpeg";
  categorieModel.categorieName = "3D";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

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
      "https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg";
  categorieModel.categorieName = "Programing";
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
      "https://images.pexels.com/photos/4473871/pexels-photo-4473871.jpeg";
  categorieModel.categorieName = "Love";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/931177/pexels-photo-931177.jpeg";
  categorieModel.categorieName = "Flowers";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg";
  categorieModel.categorieName = "Food";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/9198/nature-sky-twilight-grass-9198.jpg";
  categorieModel.categorieName = "Tree";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/326240/pexels-photo-326240.jpeg";
  categorieModel.categorieName = "Frout";
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

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/2156881/pexels-photo-2156881.jpeg";
  categorieModel.categorieName = "Abstract";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/145939/pexels-photo-145939.jpeg";
  categorieModel.categorieName = "Animal";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/104764/pexels-photo-104764.jpeg";
  categorieModel.categorieName = "Army";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg";
  categorieModel.categorieName = "Beach";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1639729/pexels-photo-1639729.jpeg";
  categorieModel.categorieName = "Brands";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg";
  categorieModel.categorieName = "Creative";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/3756616/pexels-photo-3756616.jpeg";
  categorieModel.categorieName = "Funny";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/278918/pexels-photo-278918.jpeg";
  categorieModel.categorieName = "Games";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/3444345/pexels-photo-3444345.png";
  categorieModel.categorieName = "Holidays";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg";
  categorieModel.categorieName = "Landscapes";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg";
  categorieModel.categorieName = "Sports";
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
  bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return result;
}

Future<bool> updatelockscreen(String uri) async {
  int location = WallpaperManager.LOCK_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(uri);
  bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return result;
}

Future<bool> updatebothscreen(String uri) async {
  int location = WallpaperManager.BOTH_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(uri);
  bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  print(result);
  return result;
}
