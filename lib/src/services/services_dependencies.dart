import 'package:get_it/get_it.dart';

import 'authen_service.dart';

class ServiceDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<AuthService>(() => AuthService());
  }
}
