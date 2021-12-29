import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String? label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixText;
  final String? hitText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem(
      {Key? key,
      this.label,
      this.contentBuilder,
      this.suffix,
      this.suffixText,
      this.hitText,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              label ?? '',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Expanded(
            child: contentBuilder == null
                ? TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hitText ?? '',
                    ),
                  )
                : contentBuilder!(context),
          ),
          if (suffix != null) suffix!,
          if (suffix == null && suffixText != null) Text(suffixText!),
        ],
      ),
    );
  }
}
