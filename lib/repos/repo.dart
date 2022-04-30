library repo;

import 'package:flutter_run_cat/controllers/controllers.dart';

abstract class Repo<T> {
  Future init();

  void addModelListener(ModelCallback<T> listener);

  void removeModelListener(ModelCallback<T> listener);
