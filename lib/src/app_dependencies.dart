import 'package:get_it/get_it.dart';

import 'blocs/bloc_dependencies.dart';
import 'commonts/rest_utils.dart';
import 'model/model_dependencies.dart';
import 'repositories/repository_dependencies.dart';
import 'routes/app_router.dart';
import 'services/services_dependencies.dart';
import 'utilities/app_configuration.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;
  static Future<bool> appInit() async {
    BlocDependencies.init(injector);
    injector.registerFactory<AppRouter>(() => AppRouter());
    return true;
  }

  static Future<bool> servicesInit() async {
    final config = AppDependencies.injector.get<AppConfiguration>();
    injector.registerFactory<RestUtils>(
        () => RestUtils(config.baseUrlApi, interceptors: []));
    ServiceDependencies.init(injector, 'CrossTech');
    ModelDependencies.init(injector);
    RepositoriesDependencies.init(injector);
    return true;
  }
}
