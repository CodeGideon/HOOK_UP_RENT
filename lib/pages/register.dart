import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();
  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(username)) {
      CommonToast.showToast('用户名或密码不能为空!');
      return;
    }
    if (password != repeatPassword) {
      CommonToast.showToast('两次输入密码不一致');
      return;
    }

    const url = '/register';
    var params = {'username': username, 'password': password};
    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());
    print(resString);

    int status = resString['data']['code'];
    String description = resString['data']['message'] ?? '内部错误';
    CommonToast.showToast(description);
    if (status == 0) {
      Navigator.of(context).pushNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册'),
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
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                  )),
              SizedBox(height: 20),
              TextField(
                  controller: repeatPasswordController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请确认密码',
                  )),
              SizedBox(height: 20),
              Container(
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      _registerHandler();
                    },
                    child: Text('注册', style: TextStyle(color: Colors.white))),
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
                      Navigator.popUntil(context, ModalRoute.withName("login"));
                    },
                    child: Text(
                      '去登录',
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
