import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/homapage.dart';
import 'package:wallpaper_ground/services/ad_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initfuture = MobileAds.instance.initialize();
  final adstate = Adstate(initfuture);
  runApp(Provider.value(
    value: adstate,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Ground',
      theme: ThemeData(
        backgroundColor: Constants.White,
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
