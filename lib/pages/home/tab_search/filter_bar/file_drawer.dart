import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    if (dataList != null) {
      roomTypeList = dataList['roomTypeList']!;
      orientedList = dataList['orientedList']!;
      floorList = dataList['floorList']!;
    }
    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            CommonTitle('户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectIds: selectIds,
              onChange: _onChange,
            ),
            CommonTitle('朝向'),
            FilterDrawerItem(
              list: orientedList,
              selectIds: selectIds,
              onChange: _onChange,
            ),
            CommonTitle('楼层'),
            FilterDrawerItem(
              list: floorList,
              selectIds: selectIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType>? list;
  final List? selectIds;
  final ValueChanged<String>? onChange;

  const FilterDrawerItem({Key? key, this.list, this.selectIds, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list!.map((item) {
          var isActive = selectIds!.contains(item.id);

          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange!(item.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(width: 1, color: Colors.green)),
              child: Center(
                child: Text(
                  item.name,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
