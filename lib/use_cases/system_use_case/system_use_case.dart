import 'package:flutter_run_cat/models/system.dart';
import 'package:flutter_run_cat/repos/system_repo/system_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class SystemUseCase extends UseCase<SystemRepo, System> {
  SystemUseCase(SystemRepo repo) : super(repo);
}
