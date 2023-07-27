import 'dart:convert';

import 'package:global_configs/global_configs.dart';
import 'package:http/http.dart' as http;

import '../commonts/logger_utils.dart';
import '../constances/config_path.dart';

class AppConfiguration {
  Future<void> loadLocalConfig({String? appCode}) async {
    await GlobalConfigs()
        .loadJsonFromdir('assets/cfg/server_configurations_dev.json');
    await _loadServerConfig(appCode!);
    try {} catch (ex) {
      LoggerUtils.i('$runtimeType: ${ex.toString()}');
    }
  }

  bool getBool(String key) {
    var result = GlobalConfigs().get<bool>(key);
    return result ?? false;
  }

  String getString(String key, {bool isEncrypted = false}) {
    final value = GlobalConfigs().get<String>(key);
    if (value != null) {
      return value;
    }
    return '';
  }

  void setValue<T>(String key, T value) {
    GlobalConfigs().set(key, value);
  }

  String get baseUrlApi => Uri.parse(baseUrl).origin;

  Future<void> _loadServerConfig(String appCode) async {
    try {
      var appConfigString = '';

      appConfigString = await _getAppConfig(appCode);

      final data = jsonDecode(appConfigString) as Map<String, dynamic>;
      final baseUrl = data[APIConfigPath.baseUrl] as String;
      setValue(APIConfigPath.baseUrl, baseUrl);

      final onlineOfficeCodes = data['onlineOfficeCodes'] ?? '';
      setValue('onlineOfficeCodes', onlineOfficeCodes);

      final pdOnlineOfficeCodes = data['pdOnlineOfficeCodes'] ?? '';
      setValue('pdOnlineOfficeCodes', pdOnlineOfficeCodes);

      final enableOnlineMode = data['enableOnlineMode'] ?? .0;
      setValue('enableOnlineMode', enableOnlineMode);
    } catch (ex) {
      LoggerUtils.i('$runtimeType: ${ex.toString()}');
    }
  }

  String get baseUrl => getString(APIConfigPath.baseUrl);
  Future<String> _getAppConfig(String appCode) async {
    var xKey = '5d273b0ef8074c3d8cdfccd12f2b7324';
    final baseUrl = getString('appParty');

    var headers = <String, String>{};
    var url = '$baseUrl?';
    headers.putIfAbsent('x-api-key', () => xKey);
    var httpResponse = await http.get(Uri.parse(url), headers: headers);
    if (httpResponse.statusCode == 200 && httpResponse.body.length > 100) {
      return httpResponse.body;
    } else {
      return r'''{'baseUrl','https://api.todoist.com/rest/v2'}''';
    }
  }
}
