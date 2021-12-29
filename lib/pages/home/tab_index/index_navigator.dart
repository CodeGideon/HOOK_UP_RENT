import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'index_navigator_item_copy.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: indexNavigatorItemList
              .map((item) => InkWell(
                    onTap: () {
                      item.onTap(context);
                    },
                    child: Column(
                      children: <Widget>[
                        CommonImage(
                          src: item.imagreUrl,
                          width: 47.5,
                        ),
                        Text(item.title,
                            style: TextStyle(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
