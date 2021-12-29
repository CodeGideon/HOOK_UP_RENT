import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static showToast(String str) {
    Fluttertoast.showToast(msg: str, gravity: ToastGravity.CENTER);
  }
}
