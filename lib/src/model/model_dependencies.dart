import 'package:get_it/get_it.dart';

import 'services/home/home_get_data_response.dart';

class ModelDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<GetDataHomeRespone>(() => GetDataHomeRespone());
  }
}
