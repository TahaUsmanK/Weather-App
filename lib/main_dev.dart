import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/app.dart';
import 'package:flutter_antonx_boilerplate/core/enums/env.dart';
import 'package:flutter_antonx_boilerplate/core/others/logger_customizations/custom_logger.dart';
import 'package:provider/provider.dart';
import 'locator.dart';

Future<void> main() async {
  final log = CustomLogger(className: 'main');

  try {
    log.i('Testing info logs');
    log.d('Testing debug logs');
    log.e('Testing error logs');
    log.wtf('Testing WTF logs');

    await setupLocator(Env.dev);
    runApp(
      // MultiProvider(
      //   providers: const [],
      // child: const
      MyApp(title: 'App Name'),
      // ),
    );
  } catch (e, s) {
    log.d("$e");
    log.d("$s");
  }
}
