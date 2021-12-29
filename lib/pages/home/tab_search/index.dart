import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/index.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import 'filter_bar/file_drawer.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        actions: [Container()],
        title: SearchBar(
          showLoaction: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 51,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
              child: ListView(
            children: dataList.map((item) => RoomListItemWidget(item)).toList(),
          ))
        ],
      ),
    );
  }
}
