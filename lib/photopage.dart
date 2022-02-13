import 'package:flutter/material.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/services/apimanager.dart';
import 'package:wallpaper_ground/widgets/custombtn.dart';
import 'package:motion_toast/motion_toast.dart';

class PhotoShowPage extends StatefulWidget {
  final String uri;
  const PhotoShowPage({
    Key? key,
    required this.uri,
  }) : super(key: key);

  @override
  State<PhotoShowPage> createState() => _PhotoShowPageState();
}

class _PhotoShowPageState extends State<PhotoShowPage> {
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
              image: NetworkImage(widget.uri),
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
                                  bool isupdated =
                                      await updatehomescreen(widget.uri);
                                  if (isupdated) {
                                    _displaySuccessMotionToast(
                                        context, "Home Screen Wallpaper Set");
                                    setState(() {});
                                  } else {
                                    _displayErrorMotionToast(context);
                                  }
                                },
                                child: Text(
                                  'Home Screen Wallpaper',
                                  style: Constants.heading1,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool isupdated =
                                      await updatelockscreen(widget.uri);
                                  if (isupdated) {
                                    _displaySuccessMotionToast(
                                        context, "Lock Screen Wallpaper Set");
                                    setState(() {});
                                  } else {
                                    _displayErrorMotionToast(context);
                                  }
                                },
                                child: Text(
                                  'Lock Screen Wallpaper',
                                  style: Constants.heading1,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  bool isupdated =
                                      await updatebothscreen(widget.uri);
                                  await updatehomescreen(widget.uri);
                                  if (isupdated) {
                                    _displaySuccessMotionToast(
                                        context, "Both Screen Wallpaper Set");
                                    setState(() {});
                                  } else {
                                    _displayErrorMotionToast(context);
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

  void _displaySuccessMotionToast(BuildContext context, String txt) {
    MotionToast.success(
      title: Text(
        txt,
        style: Constants.heading1,
      ),
      description: Text(
        'Have a good day!',
        style: Constants.regular2,
      ),
      layoutOrientation: ORIENTATION.rtl,
      animationType: ANIMATION.fromRight,
      width: 300,
      // onClose: () {
      //   _displayWarningMotionToast();
      // },
    ).show(context);
  }

  void _displayErrorMotionToast(BuildContext context) {
    MotionToast.error(
      title: Text("Error", style: Constants.heading1),
      description: Text(
        'Restart App Then Try Again!',
        style: Constants.regular2,
      ),
      layoutOrientation: ORIENTATION.rtl,
      animationType: ANIMATION.fromRight,
      width: 300,
    ).show(context);
  }
}
