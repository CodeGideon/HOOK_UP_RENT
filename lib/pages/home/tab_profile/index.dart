import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';

import 'advertisement.dart';
import 'function_button.dart';
import 'head.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('我的'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('SettingPage');
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: [
          Header(),
          FuntionButton(),
          Advertisement(),
          Info(),
        ],
      ),
    );
  }
}
