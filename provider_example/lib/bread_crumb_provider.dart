import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_example/bread_crub.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void add({required BreadCrumb breadcrumb}) {
    for (final item in _items) {
      item.active();
    }
    _items.add(breadcrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
