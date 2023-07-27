import '../commonts/base_service.dart';
import '../commonts/rest_utils.dart';
import '../helpers/network_helper.dart';

abstract class CrossTechBaseService extends BaseService {
  CrossTechBaseService(RestUtils restUtils) : super(restUtils) {
    if (!NetworkHelper.networkAvailable) return;
  }
}
