import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _korzina = prefs.getStringList('ff_korzina') ?? _korzina;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _korzina = [];
  List<String> get korzina => _korzina;
  set korzina(List<String> value) {
    _korzina = value;
    prefs.setStringList('ff_korzina', value);
  }

  void addToKorzina(String value) {
    korzina.add(value);
    prefs.setStringList('ff_korzina', _korzina);
  }

  void removeFromKorzina(String value) {
    korzina.remove(value);
    prefs.setStringList('ff_korzina', _korzina);
  }

  void removeAtIndexFromKorzina(int index) {
    korzina.removeAt(index);
    prefs.setStringList('ff_korzina', _korzina);
  }

  void updateKorzinaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    korzina[index] = updateFn(_korzina[index]);
    prefs.setStringList('ff_korzina', _korzina);
  }

  void insertAtIndexInKorzina(int index, String value) {
    korzina.insert(index, value);
    prefs.setStringList('ff_korzina', _korzina);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
