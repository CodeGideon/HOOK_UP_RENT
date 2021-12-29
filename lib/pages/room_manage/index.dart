import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', (context) {
          Navigator.of(context).pushNamed('RoomAdd');
        }),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('房屋管理'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: '空置',
              ),
              Tab(
                text: '已租',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            ),
            ListView(
              children:
                  dataList.map((item) => RoomListItemWidget(item)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
