import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/index.dart';

import 'pages/login.dart';

class Routes {
  //定义路由名称
  static String home = '/';
  static String login = '/login';

  //定义路由处理函数
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return IndexPage();
  });

  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage();
  });

  static void configureRoutes(FluroRouter router) {
    router.define("/home", handler: _homeHandler);
    router.define("/login", handler: _loginHandler);

    // it is also possible to define the route transition to use
    // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
  }
}
