import 'package:flutter/widgets.dart';

class DataProvider extends ChangeNotifier{
  List<Map> dataList = <Map>[];
  notifyListeners();
}