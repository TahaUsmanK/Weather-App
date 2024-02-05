import 'package:flutter_antonx_boilerplate/core/enums/env.dart';

class Config {
  final Env _env;
  final String _devBaseUrl = 'https://api.api-ninjas.com/v1/weather?';
  final String _testBaseUrl = 'https://api.api-ninjas.com/v1/weather?';
  final String _productionBaseUrl = 'https://api.api-ninjas.com/v1/weather?';
  late String _baseUrl;

  Config(this._env) {
    _setupBaseUrl();
  }

  void _setupBaseUrl() {
    _baseUrl = _getBaseUrl();
  }

  String _getBaseUrl() {
    switch (_env) {
      case Env.production:
        return _productionBaseUrl;
      case Env.test:
        return _testBaseUrl;
      case Env.dev:
        return _devBaseUrl;
    }
  }

  Env get env => _env;
  String get baseUrl => _baseUrl;
}
