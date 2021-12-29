import 'package:flutter/material.dart';

import 'index_recommnd_item_widget.dart';
import 'index_recommond_data.dart';

class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommond({Key? key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0x800000),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '房屋推荐',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text(
                '更多',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children:
                dataList.map((item) => IndexRecommondItemWidget(item)).toList(),
          )
        ],
      ),
    );
  }
}
