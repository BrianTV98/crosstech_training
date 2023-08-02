import 'package:get_it/get_it.dart';

import '../commonts/rest_utils.dart';
import 'authen_service.dart';
import 'home/cross_tech_home_service.dart';
import 'home/home_service.dart';

class ServiceDependencies {
  static void init(GetIt injector, String instanceName) {
    injector.registerFactory<AuthService>(() => AuthService());
    injector.registerFactory<HomeCrossTechService>(
        () => HomeService(injector.get<RestUtils>(instanceName: instanceName)));
  }
}
