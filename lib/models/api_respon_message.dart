import 'package:json_annotation/json_annotation.dart';

part 'api_respon_message.g.dart';

@JsonSerializable()
class ApiResponMessage{
  bool status;
  String message;
  bool isAdmin;
  String token;

  ApiResponMessage(this.status,this.message,this.isAdmin,this.token);

  factory ApiResponMessage.fromJson(Map<String, dynamic> json) => _$ApiResponMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponMessageToJson(this);
}