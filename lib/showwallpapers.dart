import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/models/picture.dart';
import 'package:wallpaper_ground/photopage.dart';
import 'package:wallpaper_ground/services/ad_state.dart';
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
  BannerAd? banner;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adstate = Provider.of<Adstate>(context);
    adstate.initialization.then((value) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adstate.bannaradunitid,
            listener: BannerAdListener(
              onAdLoaded: (Ad ad) {
                print('$BannerAd loaded.');
              },
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                print('$BannerAd failedToLoad: $error');
              },
              onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
              onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
            ),
            request: AdRequest());

        banner!.load();
      });
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
        child: Stack(
          children: [
            GridView.count(
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
            Positioned(
                bottom: 0,
                child: (banner == null)
                    ? const SizedBox(
                        height: 50,
                      )
                    : Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: AdWidget(
                          ad: banner!,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
