import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_api_service.g.dart';

@JsonSerializable()
class LoginApiService{
 String? password;
  String? email;
  LoginApiService(  {@required this.email,@required this.password});

  factory LoginApiService.fromJson(Map<String, dynamic> json) => _$LoginApiServiceFromJson(json);

  Map<String, dynamic> toJson() => _$LoginApiServiceToJson(this);
}