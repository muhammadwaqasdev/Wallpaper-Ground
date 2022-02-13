import 'package:flutter/material.dart';

import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/services/apimanager.dart';
import 'package:wallpaper_ground/widgets/custombtn.dart';

class PhotoShowPage extends StatelessWidget {
  final String uri;
  const PhotoShowPage({
    Key? key,
    required this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Constants.White,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          ClipRRect(
            child: Image(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              image: NetworkImage(uri),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CustomBtn(
                  text: "Apply",
                  onpreased: () {
                    showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Constants.White.withOpacity(0.8),
                          ),
                          margin: const EdgeInsets.all(20),
                          padding: EdgeInsets.all(10),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Apply',
                                style: Constants.heading2,
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool isupdated = await updatehomescreen(uri);
                                  if (isupdated) {
                                    print("Home Updated");
                                  } else {
                                    print("Home try");
                                  }
                                },
                                child: Text(
                                  'Home Screen Wallpaper',
                                  style: Constants.heading1,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool isupdated = await updatelockscreen(uri);
                                  if (isupdated) {
                                    print("Lock Updated");
                                  } else {
                                    print("Lock try");
                                  }
                                },
                                child: Text(
                                  'Lock Screen Wallpaper',
                                  style: Constants.heading1,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool isupdated = await updatebothscreen(uri);
                                  await updatehomescreen(uri);
                                  if (isupdated) {
                                    print("Updated");
                                  } else {
                                    print("try");
                                  }
                                },
                                child: Text(
                                  'Both',
                                  style: Constants.heading1,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  outlinebtn: true,
                  bgcolor: Colors.transparent,
                  textcolor: Constants.Primery,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
