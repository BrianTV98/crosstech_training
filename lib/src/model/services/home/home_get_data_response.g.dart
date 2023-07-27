// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_get_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataHomeRespone _$GetDataHomeResponeFromJson(Map<String, dynamic> json) =>
    GetDataHomeRespone(
      name: json['name'] as String?,
      title: json['title'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$GetDataHomeResponeToJson(GetDataHomeRespone instance) =>
    <String, dynamic>{
      'title': instance.title,
      'total': instance.total,
      'name': instance.name,
    };
