class Support {
  Support({
   required   this.url,
    required    this.text,});

  Support.fromJson(dynamic json) {
    url = json['url'];
    text = json['text'];
  }
 late String url;
late  String text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['text'] = text;
    return map;
  }

}