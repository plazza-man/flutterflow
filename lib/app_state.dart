import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  bool _onTouchPlazza = false;
  bool get onTouchPlazza => _onTouchPlazza;
  set onTouchPlazza(bool value) {
    _onTouchPlazza = value;
  }

  bool _onTouchStore = false;
  bool get onTouchStore => _onTouchStore;
  set onTouchStore(bool value) {
    _onTouchStore = value;
  }

  bool _onTouchTransaction = false;
  bool get onTouchTransaction => _onTouchTransaction;
  set onTouchTransaction(bool value) {
    _onTouchTransaction = value;
  }

  bool _onTouchLife = false;
  bool get onTouchLife => _onTouchLife;
  set onTouchLife(bool value) {
    _onTouchLife = value;
  }

  String _uploadStatus = '';
  String get uploadStatus => _uploadStatus;
  set uploadStatus(String value) {
    _uploadStatus = value;
  }
}
