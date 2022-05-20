import 'package:flutter_run_cat/repos/version_repo/version_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class VersionUseCase extends UseCase<VersionRepo> {
  VersionUseCase(VersionRepo repo) : super(repo);

  String appVersion() {
    return repo.appVersion();
  }

  String newVersion() {
    return repo.newVersion();
  }

  void visitGit() {
    repo.visitGit();
  }

  void updateVersion() {
    repo.updateVersion();
  }
}
