import 'package:cross_tech/src/commonts/data_response.dart';

import 'package:cross_tech/src/commonts/data_result.dart';

import 'package:cross_tech/src/model/services/home/home_get_data_request.dart';

import 'package:cross_tech/src/model/services/home/home_get_data_response.dart';

import '../../commonts/rest_utils.dart';
import 'cross_tech_home_service.dart';

class HomeService extends HomeCrossTechService {
  HomeService(RestUtils restUtils) : super(restUtils);

  @override
  Future<DataResult<DataResponse<GetDataHomeRespone>>> getdataHome(
      GetdataHomeReqeust request) async {
    return rest.request<GetDataHomeRespone>(Method.post, '/Home/get-all',
        data: request.toJson());
  }
}
