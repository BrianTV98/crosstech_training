import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commonts/data_response.dart';
part 'home_get_data_response.g.dart';

@JsonSerializable()
class GetDataHomeRespone extends BaseResponseModel<GetDataHomeRespone> {
  String? title;
  String? total;
  String? name;
  GetDataHomeRespone({this.name, this.title, this.total});

  @override
  GetDataHomeRespone fromJson(Map<String, dynamic> json) =>
      _$GetDataHomeResponeFromJson(json);
}
