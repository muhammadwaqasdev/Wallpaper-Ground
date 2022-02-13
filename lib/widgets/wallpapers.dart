import 'package:flutter/material.dart';

class Newwalpapers extends StatelessWidget {
  final Function onclick;
  final String uri;
  const Newwalpapers({
    Key? key,
    required this.onclick,
    required this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onclick();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            height: 600,
            width: MediaQuery.of(context).size.width / 3,
            image: NetworkImage(uri),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
