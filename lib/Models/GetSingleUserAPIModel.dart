import 'Data.dart';
import 'Support.dart';

class GetSingleUserApiModel {
  GetSingleUserApiModel({
      this.data, 
      this.support,});

  GetSingleUserApiModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  Data data;
  Support support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data.toJson();
    }
    if (support != null) {
      map['support'] = support.toJson();
    }
    return map;
  }

}