import 'Data.dart';
import 'Support.dart';

class PersonalDataModel {
  PersonalDataModel({
    required  this.page,
    required  this.perPage,
    required this.total,
    required   this.totalPages,
    required  this.data,
    required  this.support, required value, required url,});

  PersonalDataModel.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    support = (json['support'] != null ? Support.fromJson(json['support']) : null)!;
  }
 late int page;
  late int perPage;
  late int total;
  late int totalPages;
  late List<Data> data;
  late Support support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support.toJson();
    }
    return map;
  }

}