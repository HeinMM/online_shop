// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginApiService _$LoginApiServiceFromJson(Map<String, dynamic> json) =>
    LoginApiService(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginApiServiceToJson(LoginApiService instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };
