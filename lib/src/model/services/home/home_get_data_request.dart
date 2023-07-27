import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commonts/baserequest_model.dart';
part 'home_get_data_request.g.dart';

@JsonSerializable(includeIfNull: false)
class GetdataHomeReqeust extends BaseRequestModel {
  @override
  Map<String, dynamic> toJson() => _$GetdataHomeReqeustToJson(this);
  String? phone1;
  String? email;
  String? address;
  GetdataHomeReqeust({this.address, this.email, this.phone1});
}
