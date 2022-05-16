import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

const _pubYamlPath =
    "https://raw.githubusercontent.com/yoehwan/flutter_run_cat/main/pubspec.yaml";
class VersionService {
  Future<String> appVersion() async {
    final _info = await PackageInfo.fromPlatform();
    return _info.version;
  }

  Future<String> newVersion() async {
    try {
      final _res = await http.get(Uri.parse(_pubYamlPath));
      final _yaml = loadYaml(_res.body);
      final _version = _yaml['version'].toString();
      return _version.split("+").first;
    } catch (e) {
      print(e);
      return await appVersion();
    }
  }
}
