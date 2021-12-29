import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import 'index_navigator.dart';
import 'index_recommond.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(
            showLoaction: true,
            showMap: true,
            onSearch: () {
              Navigator.of(context).pushNamed('login');
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            CommonSwiper(),
            IndexNavigator(),
            IndexRecommond(),
            Info(showTitle: true),
            Text('这是内容区域'),
          ],
        ));
  }
}
