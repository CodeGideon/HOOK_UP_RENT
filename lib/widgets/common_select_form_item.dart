import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_pick.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String? label;
  final List<String>? options;
  final int? value;
  final ValueChanged<int?>? onChange;

  const CommonSelectFormItem(
      {Key? key, this.label, this.options, this.value, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            var result = CommonPicker.showPicker(
                context: context, value: value, options: options);
            result!.then((selectValue) {
              if (value != selectValue &&
                  selectValue != null &&
                  onChange != null) {
                onChange!(selectValue);
              }
            });
          },
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(options![value!]),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
