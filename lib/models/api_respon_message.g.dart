// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_respon_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponMessage _$ApiResponMessageFromJson(Map<String, dynamic> json) =>
    ApiResponMessage(
      json['status'] as bool,
      json['message'] as String,
      json['isAdmin'] as bool,
      json['token'] as String,
    );

Map<String, dynamic> _$ApiResponMessageToJson(ApiResponMessage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isAdmin': instance.isAdmin,
      'token': instance.token,
    };
