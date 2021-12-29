import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'info.dart';

var textStyle = TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  const ItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 100,
        child: Row(
          children: [
            CommonImage(src: data.imageUrl, width: 120, height: 90),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.source, style: textStyle),
                      Text(
                        data.time,
                        style: textStyle,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
