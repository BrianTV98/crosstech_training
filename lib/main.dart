import 'package:cross_tech/src/core/commonts/command_dender.dart';
import 'package:cross_tech/src/core/commonts/logger_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/config/firebase_options.dart';

import 'src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Cross_Tech',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _initApp();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('vi')],
        startLocale: const Locale('vi'),
        fallbackLocale: const Locale('vi'),
        path: 'assets/localizations',
        child: MyApp()),
  );
}

Future<bool> _initApp() async {
  // try {
  //   final bool appInit = await AppDependencies.appInit();
  //   if (!appInit) {
  //     return false;
  //   }
  //   await _loadConfig();
  // } catch (ex) {
  //   LoggerUtils.e('cross_tech: ${ex.toString()}');
  //   return false;
  // }
  return true;
}

Future<bool> _loadConfig() async {
  try {
    await _startLoadDependency();
  } catch (ex) {
    await CommandSender.dismissLoading();
    return false;
  }
  await CommandSender.dismissLoading();
  return true;
}

Future<bool> _startLoadDependency() async {
  // final bool servicesInit = await AppDependencies.servicesInit();
  // if (!servicesInit) {
  //   return false;
  // }
  //
  return false;
}
