import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/repos/repo.dart';

abstract class UseCase<T extends Repo<K>, K> {
  UseCase(this.repo);
  final T repo;

  Future init() async {
    await repo.init();
  }

  void addModelListener(ModelCallback<K> listener) {
    repo.addModelListener(listener);
  }

  void removeModelListener(ModelCallback<K> listener) {
    repo.removeModelListener(listener);
  }
}
