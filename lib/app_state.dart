import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _album1 = prefs.getStringList('ff_album1') ?? _album1;
    });
    _safeInit(() {
      _album2 = prefs.getStringList('ff_album2') ?? _album2;
    });
    _safeInit(() {
      _album3 = prefs.getStringList('ff_album3') ?? _album3;
    });
    _safeInit(() {
      _album4 = prefs.getStringList('ff_album4') ?? _album4;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _album1 = [];
  List<String> get album1 => _album1;
  set album1(List<String> _value) {
    _album1 = _value;
    prefs.setStringList('ff_album1', _value);
  }

  void addToAlbum1(String _value) {
    _album1.add(_value);
    prefs.setStringList('ff_album1', _album1);
  }

  void removeFromAlbum1(String _value) {
    _album1.remove(_value);
    prefs.setStringList('ff_album1', _album1);
  }

  void removeAtIndexFromAlbum1(int _index) {
    _album1.removeAt(_index);
    prefs.setStringList('ff_album1', _album1);
  }

  void updateAlbum1AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _album1[_index] = updateFn(_album1[_index]);
    prefs.setStringList('ff_album1', _album1);
  }

  void insertAtIndexInAlbum1(int _index, String _value) {
    _album1.insert(_index, _value);
    prefs.setStringList('ff_album1', _album1);
  }

  List<String> _album2 = [];
  List<String> get album2 => _album2;
  set album2(List<String> _value) {
    _album2 = _value;
    prefs.setStringList('ff_album2', _value);
  }

  void addToAlbum2(String _value) {
    _album2.add(_value);
    prefs.setStringList('ff_album2', _album2);
  }

  void removeFromAlbum2(String _value) {
    _album2.remove(_value);
    prefs.setStringList('ff_album2', _album2);
  }

  void removeAtIndexFromAlbum2(int _index) {
    _album2.removeAt(_index);
    prefs.setStringList('ff_album2', _album2);
  }

  void updateAlbum2AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _album2[_index] = updateFn(_album2[_index]);
    prefs.setStringList('ff_album2', _album2);
  }

  void insertAtIndexInAlbum2(int _index, String _value) {
    _album2.insert(_index, _value);
    prefs.setStringList('ff_album2', _album2);
  }

  List<String> _album3 = [];
  List<String> get album3 => _album3;
  set album3(List<String> _value) {
    _album3 = _value;
    prefs.setStringList('ff_album3', _value);
  }

  void addToAlbum3(String _value) {
    _album3.add(_value);
    prefs.setStringList('ff_album3', _album3);
  }

  void removeFromAlbum3(String _value) {
    _album3.remove(_value);
    prefs.setStringList('ff_album3', _album3);
  }

  void removeAtIndexFromAlbum3(int _index) {
    _album3.removeAt(_index);
    prefs.setStringList('ff_album3', _album3);
  }

  void updateAlbum3AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _album3[_index] = updateFn(_album3[_index]);
    prefs.setStringList('ff_album3', _album3);
  }

  void insertAtIndexInAlbum3(int _index, String _value) {
    _album3.insert(_index, _value);
    prefs.setStringList('ff_album3', _album3);
  }

  List<String> _album4 = [];
  List<String> get album4 => _album4;
  set album4(List<String> _value) {
    _album4 = _value;
    prefs.setStringList('ff_album4', _value);
  }

  void addToAlbum4(String _value) {
    _album4.add(_value);
    prefs.setStringList('ff_album4', _album4);
  }

  void removeFromAlbum4(String _value) {
    _album4.remove(_value);
    prefs.setStringList('ff_album4', _album4);
  }

  void removeAtIndexFromAlbum4(int _index) {
    _album4.removeAt(_index);
    prefs.setStringList('ff_album4', _album4);
  }

  void updateAlbum4AtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _album4[_index] = updateFn(_album4[_index]);
    prefs.setStringList('ff_album4', _album4);
  }

  void insertAtIndexInAlbum4(int _index, String _value) {
    _album4.insert(_index, _value);
    prefs.setStringList('ff_album4', _album4);
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
