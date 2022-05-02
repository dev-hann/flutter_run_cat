library repo;

import 'package:flutter_run_cat/controllers/controllers.dart';

abstract class Repo<T> {
  Future init();

  final List<ModelCallback<T>> _listeners = [];

  void addModelListener(ModelCallback<T> listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  void removeModelListener(ModelCallback<T> listener) {
    _listeners.remove(listener);
  }

  void notifyModelListeners(T value) {
    for (final listener in _listeners) {
      listener(value);
    }
  }
}
