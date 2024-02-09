import 'package:flutter_antonx_boilerplate/core/config/config.dart';
import 'package:flutter_antonx_boilerplate/core/enums/env.dart';
import 'package:get_it/get_it.dart';
import 'core/services/api_services.dart';

GetIt locator = GetIt.instance;

setupLocator(Env env) async {
  locator.registerSingleton(Config(env));
  locator.registerSingleton<ApiService>(ApiService());
}
