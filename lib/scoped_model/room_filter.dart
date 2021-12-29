import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterBarModel extends Model {
  List<GeneralType>? _roomTypeList;
  List<GeneralType>? _orientedList;
  List<GeneralType>? _floorList;

  Set<String> _selectedList = Set<String>();

  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    if (_roomTypeList != null) {
      result['roomTypeList'] = _roomTypeList!;
    }
    if (_orientedList != null) {
      result['orientedList'] = _orientedList!;
    }
    if (_floorList != null) {
      result['floorList'] = _floorList!;
    }
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList'];
    _orientedList = data['orientedList'];
    _floorList = data['floorList'];
    notifyListeners();
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }
}
