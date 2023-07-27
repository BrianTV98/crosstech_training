import '../../commonts/data_response.dart';
import '../../commonts/data_result.dart';
import '../../commonts/rest_utils.dart';
import '../../model/services/home/home_get_data_request.dart';
import '../../model/services/home/home_get_data_response.dart';
import '../cross_tech_service.dart';

abstract class HomeCrossTechService extends CrossTechBaseService {
  HomeCrossTechService(RestUtils restUtils) : super(restUtils);
  Future<DataResult<DataResponse<GetDataHomeRespone>>> getdataHome(
      GetdataHomeReqeust request);
}
