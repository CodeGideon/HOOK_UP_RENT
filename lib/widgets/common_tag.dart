import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backroundColor;

  static const Color defaultBGcolor = Color.fromRGBO(245, 245, 245, 1.0);

  const CommonTag(
      {Key? key,
      required this.title,
      this.color = Colors.black,
      this.backroundColor = defaultBGcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
      child: Text(title, style: TextStyle(fontSize: 10, color: color)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backroundColor,
      ),
    );
  }
}
