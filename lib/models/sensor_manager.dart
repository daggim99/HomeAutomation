import 'package:flutter/material.dart';

import 'sensor_item.dart';

class SensorManager extends ChangeNotifier {
  final _sensorItems = <SensorItem>[];
  int _selectedIndex = -1;
  bool _createNewItem = false;

  List<SensorItem> get groceryItems => List.unmodifiable(_sensorItems);
  int get selectedIndex => _selectedIndex;
  SensorItem? get selectedSensorItem =>
      _selectedIndex != -1 ? _sensorItems[_selectedIndex] : null;
  bool get isCreatingNewItem => _createNewItem;

  void createNewItem() {
    _createNewItem = true;
    notifyListeners();
  }

  void deleteItem(int index) {
    _sensorItems.removeAt(index);
    notifyListeners();
  }

  void sensorItemTapped(int index) {
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void addItem(SensorItem item) {
    _sensorItems.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(SensorItem item, int index) {
    _sensorItems[index] = item;
    _selectedIndex = -1;
    _createNewItem = false;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _sensorItems[index];
    _sensorItems[index] = item.copyWith(isTrigerd: change);
    notifyListeners();
  }
}
