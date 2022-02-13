import 'package:flutter/material.dart';
import 'package:wallpaper_ground/constants.dart';

class custominput extends StatelessWidget {
  final String hinttxt;
  final bool ispassword;
  final Widget icc;
  final TextEditingController conto;
  final Function ontap;

  const custominput({
    Key? key,
    required this.hinttxt,
    required this.ispassword,
    required this.icc,
    required this.conto,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
        color: Constants.White,
      ),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onTap: () {
                ontap();
              },
              validator: (val) {
                return val!.isEmpty ? null : "Please Enter";
              },
              controller: conto,
              obscureText: ispassword,
              decoration: InputDecoration(
                icon: icc,
                border: InputBorder.none,
                hintText: hinttxt,
                // contentPadding: const EdgeInsets.symmetric(
                //   horizontal: 5.0,
                //   vertical: 3.0,
                // ),
              ),
              style: Constants.regular2,
            ),
          ],
        ),
      ),
    );
  }
}
