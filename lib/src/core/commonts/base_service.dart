import 'package:cross_tech/src/core/commonts/rest_utils.dart';

abstract class BaseService {
  late RestUtils rest;
  BaseService(RestUtils restUtils) {
    rest = restUtils;
  }
}
