import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  final String text;
  final String image;
  final Function onclick;
  const CustomCategory({
    Key? key,
    required this.text,
    required this.image,
    required this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onclick();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 2.5,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 2.5,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: FittedBox(
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
