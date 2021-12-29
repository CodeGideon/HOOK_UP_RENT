import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/common_tag.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:share/share.dart';

class RoomDetailPage extends StatefulWidget {
  var roomId;

  RoomDetailPage({Key? key, this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  bool isLike = false;
  bool showAllText = false;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.roomId = ModalRoute.of(context)?.settings.arguments;
    var showTextTool = data.subTitle.length > 100;
    if (data == null) return Container();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${widget.roomId}'),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('https://itcast.cn');
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(images: data.houseImgs),
              CommonTitle(data.title),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data.price.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.pink)),
                    Text(
                      '元/月(押一付三)',
                      style: TextStyle(fontSize: 14, color: Colors.pink),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 6, bottom: 6),
                child: Wrap(
                    spacing: 4,
                    children: data.tags
                        .map((item) => CommonTag(
                              title: item,
                            ))
                        .toList()),
              ),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 6),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    BaseInfoItem(content: '面积:${data.size}平方米'),
                    BaseInfoItem(content: '楼层:${data.floor}'),
                    BaseInfoItem(content: '户型:${data.roomType}'),
                    BaseInfoItem(content: '装修:精装'),
                  ],
                ),
              ),
              CommonTitle('房屋配置'),
              RoomApplicanceList(data.applicances),
              CommonTitle('房屋概括'),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle,
                      maxLines: showAllText ? 5 : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '展开' : '收起'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up)
                                  ],
                                ),
                              )
                            : Container(),
                        Text('举报')
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle('猜你喜欢'),
              Container(
                height: 200,
              )
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              color: Colors.grey,
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 60,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Container(
                              child: Icon(
                                isLike ? Icons.star : Icons.star_border,
                                color: isLike ? Colors.green : Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Text(
                            isLike ? '已收藏' : '收藏',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                        child: Text(
                          '联系房东',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '预约看房',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 20 - 10) / 2,
      child: Text(
        content,
        // style: TextStyle(fontSize: 14),
      ),
    );
  }
}
