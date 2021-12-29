import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?>? showPicker(
      {BuildContext? context,
      List<String>? options,
      int? value,
      double height = 300}) {
    return showCupertinoModalPopup(
        context: context!,
        builder: (BuildContext context) {
          var buttonTextStyle = ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green));
          var controller = FixedExtentScrollController(initialItem: value!);
          return Container(
            // color: Colors.grey,
            color: Color.fromRGBO(198, 196, 196, 1),
            height: height,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: buttonTextStyle,
                          child: Text(
                            '取消',
                            // style: buttonTextStyle,
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(controller.selectedItem);
                          },
                          style: buttonTextStyle,
                          child: Text(
                            '确定',
                            // style: buttonTextStyle,
                          )),
                    ],
                  ),
                ),
                Expanded(
                    child: CupertinoPicker(
                        scrollController: controller,
                        itemExtent: 32,
                        onSelectedItemChanged: (val) {},
                        children: options!.map((item) => Text(item)).toList()))
              ],
            ),
          );
        });
  }
}
