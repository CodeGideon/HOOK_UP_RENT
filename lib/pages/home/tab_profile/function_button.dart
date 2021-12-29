import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/function_button_data.dart';

import 'funtion_button_widget.dart';

class FuntionButton extends StatelessWidget {
  const FuntionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1,
        runSpacing: 1,
        children: list.map((item) => FunctionButtonWidget(item)).toList(),
      ),
    );
  }
}
