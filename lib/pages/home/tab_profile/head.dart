import 'package:flutter/material.dart';

var longinRegisterStyle = TextStyle(fontSize: 20, color: Colors.white);

class Header extends StatelessWidget {
  @override
  Widget _loginBuilder(BuildContext context) {
    String userName = '大胖';
    String userImage =
        'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: longinRegisterStyle,
              ),
              Text(
                '查看个人资料',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(top: 6)),
                  GestureDetector(
                    child: Text('登录', style: longinRegisterStyle),
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                  ),
                  Text(
                    '/',
                    style: longinRegisterStyle,
                  ),
                  GestureDetector(
                    child: Text('注册', style: longinRegisterStyle),
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                  ),
                ],
              ),
              Text(
                '登录后可以体验更多',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = false;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
