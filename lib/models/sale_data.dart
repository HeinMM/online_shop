// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_data.g.dart';

@JsonSerializable()
class SaleData {
  int? id;
  String? title;
  String? normal_price;
  String? sale_price;
  String? dec;
  String? qty;
  String? waiting_time;

  SaleData(
      {@required this.id,
      @required this.title,
      @required this.normal_price,
      @required this.sale_price,
      @required this.dec,
      @required this.qty,
      @required this.waiting_time});

  factory SaleData.fromJson(Map<String, dynamic> json) =>
      _$SaleDataFromJson(json);

  Map<String, dynamic> toJson() => _$SaleDataToJson(this);
}