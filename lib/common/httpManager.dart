import 'package:http/http.dart';
import 'dart:convert';
class HttpManager {
  static String url = "http://api.bel-door.com/api/";
  static Map<String, String> headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };
  static getRequest(String target,Map body) async {

  }
  static postRequest(String target,Map body) async {
    print(target);
    print(body);
    return await post(
        url + target, body: jsonEncode(body),
        headers: headers);
  }
}
