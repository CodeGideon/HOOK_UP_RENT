import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';

import 'home/tab_index/index.dart';
import 'home/tab_info/index.dart';
import 'home/tab_profile/index.dart';

List<Widget> tabList = [
  TabIndex(),
  TabSearch(),
  TabInfo(),
  TabProfile(),
];

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: '咨询', icon: Icon(Icons.info)),
  BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
];

Widget PageContent(String name) {
  return Scaffold(
    appBar: AppBar(automaticallyImplyLeading: false, title: Text(name)),
  );
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: barItemList,
          selectedItemColor: Colors.green,
          currentIndex: _selectIndex,
          onTap: (int index) {
            setState(() {
              _selectIndex = index;
            });
          }),
    );
  }
}
