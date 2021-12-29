import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'function_button_data.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;
  const FunctionButtonWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.onTapHandle != null) {
          data.onTapHandle!(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          children: [
            CommonImage(
              src: data.imageUrl,
              // width: 100,
              // height: 100,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(data.title)
          ],
        ),
      ),
    );
  }
}
