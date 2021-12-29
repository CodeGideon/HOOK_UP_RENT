import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'index_recommond_data.dart';

var textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommondItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("data.navigateUrl = $data.navigateUrl");
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  data.title,
                  style: textStyle,
                ),
                Text(
                  data.subTitle,
                  style: textStyle,
                ),
              ],
            ),
            CommonImage(
              src: data.imageUrl,
              width: 55,
            )
          ],
        ),
      ),
    );
  }
}
