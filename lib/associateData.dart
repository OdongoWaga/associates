import 'package:associates/model/associate.dart';
import 'package:associates/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AssociateData extends ChangeNotifier {
  static const String _boxName = "associateBox";

  List<Associate> _associate = [];

  Associate _activeAssociate;

  void getAssociates() async {
    var box = await Hive.openBox<Associate>(_boxName);

    _associate = box.values.toList();

    notifyListeners();
  }

  Associate getAssociate(index) {
    return _associate[index];
  }

  void addAssociate(Associate associate) async {
    var box = await Hive.openBox<Associate>(_boxName);

    await box.add(associate);

    _associate = box.values.toList();

    notifyListeners();
  }

  void deleteAssociate(key) async {
    var box = await Hive.openBox<Associate>(_boxName);

    await box.delete(key);

    _associate = box.values.toList();

    Log.i("Deleted member with key" + key.toString());

    notifyListeners();
  }

  void editAssociate({Associate associate, int associateKey}) async {
    var box = await Hive.openBox<Associate>(_boxName);

    await box.put(associateKey, associate);

    _associate = box.values.toList();

    _activeAssociate = box.get(associateKey);

    Log.i("Edited " + associate.name);

    notifyListeners();
  }

  void setActiveAssociate(key) async {
    var box = await Hive.openBox<Associate>(_boxName);

    _activeAssociate = box.get(key);

    notifyListeners();
  }

  Associate getActiveAssociate() {
    return _activeAssociate;
  }

  int get associateCount {
    return _associate.length;
  }
}
