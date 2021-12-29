import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('RoomDetail', arguments: data.title);
      },
      child: Container(
        child: Row(
          children: [
            CommonImage(
              src: data.imageUrl,
              width: 132.5,
              height: 100,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(data.subTitle),
                Wrap(
                  children: data.tags
                      .map((item) => CommonTag(
                            title: item,
                            color: Color.fromRGBO(
                                Random().nextInt(256),
                                Random().nextInt(256),
                                Random().nextInt(256),
                                1),
                          ))
                      .toList(),
                ),
                Text(
                  '${data.price} 元/月',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
