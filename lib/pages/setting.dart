import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              print('退出');
              CommonToast.showToast('已经退出登录');
            },
            child: Text('退出登录'),
          )
        ],
      ),
    );
  }
}
