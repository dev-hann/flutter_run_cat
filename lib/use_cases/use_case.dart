import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/repos/repo.dart';

abstract class UseCase<T> {
  UseCase(this.repo);
  final Repo<T> repo;

  Future init() async {
    await repo.init();
  }

  void addModelListener(ModelCallback<T> listener) {
    repo.addModelListener(listener);
  }

  void removeModelListener(ModelCallback<T> listener) {
    repo.removeModelListener(listener);
  }
}
