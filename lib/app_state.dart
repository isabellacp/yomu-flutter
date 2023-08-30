import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'misc/util.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chapterRead = prefs.getStringList('chapterRead')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _chapterRead;
    });
    _safeInit(() {
      _chapterReading = prefs.getStringList('chapterReading')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _chapterReading;
    });
    _safeInit(() {
      _favoritedManga =
          prefs.getStringList('favoritedManga') ?? _favoritedManga;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _chapterRead = [];
  List<dynamic> get chapterRead => _chapterRead;
  set chapterRead(List<dynamic> _value) {
    _chapterRead = _value;
    prefs.setStringList(
        'chapterRead', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToChapterRead(dynamic _value) {
    _chapterRead.add(_value);
    prefs.setStringList(
        'chapterRead', _chapterRead.map((x) => jsonEncode(x)).toList());
  }

  void removeFromChapterRead(dynamic _value) {
    _chapterRead.remove(_value);
    prefs.setStringList(
        'chapterRead', _chapterRead.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _chapterReading = [];
  List<dynamic> get chapterReading => _chapterReading;
  set chapterReading(List<dynamic> _value) {
    _chapterReading = _value;
    prefs.setStringList(
        'chapterReading', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToChapterReading(dynamic _value) {
    _chapterReading.add(_value);
    prefs.setStringList(
        'chapterReading', _chapterReading.map((x) => jsonEncode(x)).toList());
  }

  void removeFromChapterReading(dynamic _value) {
    _chapterReading.remove(_value);
    prefs.setStringList(
        'chapterReading', _chapterReading.map((x) => jsonEncode(x)).toList());
  }

  List<String> _favoritedManga = [];
  List<String> get favoritedManga => _favoritedManga;
  set favoritedManga(List<String> _value) {
    _favoritedManga = _value;
    prefs.setStringList('favoritedManga', _value);
  }

  void addToFavoritedManga(String _value) {
    _favoritedManga.add(_value);
    prefs.setStringList('favoritedManga', _favoritedManga);
  }

  void removeFromFavoritedManga(String _value) {
    _favoritedManga.remove(_value);
    prefs.setStringList('favoritedManga', _favoritedManga);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}
