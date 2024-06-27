import 'package:safety/constants/constants.dart';
import 'package:safety/generated/json/base/json_convert_content.dart';

class AppResponse<T> {
  String? code;
  String? message;
  T? data;

  AppResponse(this.code, this.message, this.data);

  AppResponse.fromJson(Map<String, dynamic> map) {
    code = map['code'].toString();
    message = map['message'] as String?;
    if (map.containsKey('data')) {
      data = _generateOBJ(map['data']);
    }
  }

  T? _generateOBJ<O>(Object? json) {
    if (json == null) {
      return null;
    }
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据由fromJsonAsT判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }

  bool get isSuccessful => code == Constant.successCode;
}
