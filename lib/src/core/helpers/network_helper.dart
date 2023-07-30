import 'dart:async';
import 'package:universal_html/html.dart' as html;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_dependencies.dart';
import '../commonts/logger_utils.dart';

import '../routes/app_router.dart';

class NetworkHelper {
  static bool networkAvailable = false;
  static bool shouldRestartApp = false;
  static String currentPage = MainPageRoute.name;
  static bool shouldShowErrorMessage = shouldRestartApp && !networkAvailable;
  static String errorMessage =
      networkAvailable ? tr('error_message') : tr('lost_internet');
  late StreamSubscription<ConnectivityResult>? _networkSubscription;

  Future<void> initConnectivity() async {
    final connectivity = AppDependencies.injector.get<Connectivity>();
    try {
      networkAvailable =
          (await connectivity.checkConnectivity()) != ConnectivityResult.none;
      errorMessage =
          networkAvailable ? tr('error_message') : tr('lost_internet');
      _networkSubscription =
          connectivity.onConnectivityChanged.listen((result) async {
        networkAvailable = result != ConnectivityResult.none;
        if (networkAvailable && shouldRestartApp) {
          if (currentPage == MainPageRoute.name) {
            html.window.location.replace(Uri.base.path.toString());
          } else if (currentPage == ContactPageRoute.name ||
              currentPage == PlanPageRoute.name) {
            html.window.location.reload();
          } else {
            html.window.history.back();
          }
        }
      });
    } on Exception catch (e) {
      LoggerUtils.i(e.toString());
    }
    return;
  }

  void dispose() {
    _networkSubscription?.cancel();
  }
}
