
import 'package:flutter_run_cat/repos/version_repo/version_repo.dart';
import 'package:flutter_run_cat/services/version_service/version_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

const String _gitPath = "https://github.com/yoehwan/flutter_run_cat";

class VersionImpl extends VersionRepo {
  final VersionService _service = VersionService();
  String _appVersion = "";
  String _newVersion = "";
  @override
  Future init() async {
    _appVersion = await _service.appVersion();
    _newVersion = await _service.newVersion();
  }

  @override
  String appVersion() {
    return _appVersion;
  }

  @override
  String newVersion() {
    return _newVersion;
  }

  @override
  void visitGit() {
    launchUrlString(_gitPath);
  }

  @override
  Future updateVersion() async {
  }
}
