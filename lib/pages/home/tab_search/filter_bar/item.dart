import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Function(BuildContext)? onTap;

  const Item({Key? key, this.title, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = isActive! ? Colors.green : Colors.black87;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(context);
      },
      child: Container(
        child: Row(
          children: [
            Text(
              title!,
              style: TextStyle(color: color),
            ),
            Icon(Icons.arrow_drop_down, size: 20, color: color),
          ],
        ),
      ),
    );
  }
}
