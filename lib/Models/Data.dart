class Data {
  Data({
    required    this.id,
    required    this.email,
    required   this.firstName,
    required   this.lastName,
    required   this.avatar,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
 late int id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['avatar'] = avatar;
    return map;
  }

}