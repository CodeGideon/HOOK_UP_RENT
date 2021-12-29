import 'package:flutter/material.dart';

import '../common_image.dart';

class SearchBar extends StatefulWidget {
  final bool? showLoaction;
  final Function? goBackCallback;
  final String? inputValue;
  final String defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.showLoaction,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _focus;
  void _onClean() {
    setState(() {
      _searchWord = '';
      _controller.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController(text: widget.inputValue);
    _focus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.showLoaction != null)
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                print('定位点击');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    '北京',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        if (widget.goBackCallback != null)
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: widget.goBackCallback as GestureTapCallback,
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 16,
              ),
            ),
          ),
        Expanded(
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.grey[200]),
            child: TextField(
              focusNode: _focus,
              onChanged: (String value) {
                setState(() {
                  _searchWord = value;
                });
              },
              onTap: () {
                if (widget.onSearchSubmit == null) {
                  _focus.unfocus();
                }
                widget.onSearch!();
              },
              onSubmitted: widget.onSearchSubmit,
              controller: _controller,
              textInputAction: TextInputAction.search,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 1, left: -10),
                  border: InputBorder.none,
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      print('清理');
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                    ),
                  ),
                  hintText: '请输入搜索词',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
            ),
          ),
        ),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              child: Text(
                '取消',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14),
              ),
              onTap: widget.onCancel! as GestureTapCallback,
            ),
          ),
        if (widget.showMap != null)
          CommonImage(
            src: 'static/icons/widget_search_bar_map.png',
            width: 40,
            height: 40,
          ),
      ],
    );
  }
}
