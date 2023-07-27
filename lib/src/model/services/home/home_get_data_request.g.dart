// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_get_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetdataHomeReqeust _$GetdataHomeReqeustFromJson(Map<String, dynamic> json) =>
    GetdataHomeReqeust(
      address: json['address'] as String?,
      email: json['email'] as String?,
      phone1: json['phone1'] as String?,
    );

Map<String, dynamic> _$GetdataHomeReqeustToJson(GetdataHomeReqeust instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone1', instance.phone1);
  writeNotNull('email', instance.email);
  writeNotNull('address', instance.address);
  return val;
}
