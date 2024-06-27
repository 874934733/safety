class BaseEntity {
  BaseData? data;
  int? code;
  String? message;

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    data = json['_data'] != null ? BaseData.fromJson(json['_data']) : null;
    code = json['_code'];
    message = json['_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['_data'] = this.data?.toJson();
    }
    data['_code'] = this.code;
    data['_message'] = this.message;
    return data;
  }
}

class BaseData {
  dynamic data;
  int? code;
  String? message;

  BaseData({this.data, this.code, this.message});

  BaseData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? json['data'] : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
