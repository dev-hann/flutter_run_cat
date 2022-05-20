import 'package:flutter_run_cat/repos/repo.dart';

abstract class VersionRepo extends Repo {
  String appVersion();

  String newVersion();

  void visitGit();

  Future updateVersion();

}
