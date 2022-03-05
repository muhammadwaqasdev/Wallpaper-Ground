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
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.White,
          borderRadius: BorderRadius.circular(15),
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
                ),
                style: Constants.regular2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
