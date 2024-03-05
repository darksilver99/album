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
