import 'package:flutter_run_cat/repos/repo.dart';

abstract class UseCase<T extends Repo> {
  UseCase(this.repo);
  final T repo;

  Future init() async {
    await repo.init();
  }
}
