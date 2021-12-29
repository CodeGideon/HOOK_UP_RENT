import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/utils/store.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  void _loginHandle() async {
    var userName = usernameController.text;
    var passWord = passwordController.text;
    if (stringIsNullOrEmpty(userName) || stringIsNullOrEmpty(passWord)) {
      CommonToast.showToast('用户名或密码不能为空!');
      return;
    }
    const url = '/login';
    var params = {'userName': userName, 'passWord': passWord};
    var res = await DioHttp.of(context).post(url, params);
    var resMap = json.decode(res.toString());

    print(resMap);

    int status = resMap['data']['code'];
    String description = resMap['data']['message'] ?? '内部错误';
    CommonToast.showToast(description);
    if (status == 0) {
      String token = resMap['data']['token'];
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);

      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }

  bool _showPassworld = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(30),
          child: ListView(
            children: [
              TextField(
                  controller: usernameController,
                  decoration:
                      InputDecoration(labelText: '用户名', hintText: '请输入用户名')),
              SizedBox(height: 20),
              TextField(
                  controller: passwordController,
                  obscureText: !_showPassworld,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      suffixIcon: IconButton(
                        icon: Icon(_showPassworld
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _showPassworld = !_showPassworld;
                          });
                        },
                      ))),
              SizedBox(height: 20),
              Container(
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      _loginHandle();
                    },
                    child: Text('登录', style: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('还没有账号'),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      print('去注册');
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text(
                      '去注册',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
