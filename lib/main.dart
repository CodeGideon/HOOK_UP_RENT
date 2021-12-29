import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/index.dart';
import 'package:hook_up_rent/pages/loading.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/room_add/index.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';
import 'package:hook_up_rent/pages/room_manage/index.dart';
import 'package:hook_up_rent/pages/setting.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/index.dart';
import 'pages/room_detail/index.dart';
import 'pages/room_manage/index.dart';
import 'pages/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: AuthModel(),
      child: ScopedModel<FilterBarModel>(
          model: FilterBarModel(),
          child: MaterialApp(
            initialRoute: 'LoadingPage',
            routes: {
              '/': (context) => IndexPage(),
              'login': (context) => LoginPage(),
              'register': (context) => RegisterPage(),
              'SettingPage': (context) => SettingPage(),
              'RoomManagePage': (context) => RoomManagePage(),
              'RoomAdd': (context) => RoomAddPage(),
              'RoomDetail': (context) => RoomDetailPage(),
              'LoadingPage': (context) => LoadingPage()
            },
            theme: ThemeData(primaryColor: Colors.green),
          )),
    );
  }
}
