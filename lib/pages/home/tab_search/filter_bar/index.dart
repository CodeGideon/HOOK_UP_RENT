import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/item.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/common_pick.dart';
import 'package:hook_up_rent/utils/scopoed_model_helper.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult>? onChange;

  const FilterBar({Key? key, this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = !isAreaActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: areaList.map((item) => item.name).toList());
    if (result == null) return;
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
    _onChange;
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = !isRentTypeActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: rentTypeList.map((item) => item.name).toList());
    if (result == null) return;
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = rentTypeList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
    _onChange;
  }

  _onPriceChange(context) {
    setState(() {
      isPriceActive = !isPriceActive;
    });
    var result = CommonPicker.showPicker(
        value: 0,
        context: context,
        options: priceList.map((item) => item.name).toList());
    if (result == null) return;
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = priceList[index].id;
      });
    });
    result.whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
    _onChange;
  }

  _onFilterChange(context) {
    Scaffold.of(context).openDrawer();
  }

  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange!(FilterBarResult(
        areaId: areaId,
        rentTypeId: rentTypeId,
        priceId: priceId,
        moreId: moreIds,
        moreIds: selectedList.toList(),
      ));
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;

    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      height: 51,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: false,
            onTap: _onFilterChange,
          )
        ],
      ),
    );
  }
}
