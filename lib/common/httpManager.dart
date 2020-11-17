import 'package:http/http.dart';
import 'dart:convert';
class HttpManager {
  static String url = "http://api.bel-door.com/api/";
  static Map<String, String> headers = {
    'Authorization': ' ',
    "Accept": "application/json",
    "content-type": "application/json"
  };
  static setToken(token){
    headers['Authorization']='Bearer $token';
  }
  static getRequest(String target,query) async {
    var uri = Uri(
      scheme: 'http',
      host: 'api.bel-door.com',
      path: 'api/Ticket/VisitorDailyTickets',
      queryParameters: query,
    );
    return await get(uri,headers: headers);
  }
  static postRequest(String target,Map body) async {
    print(target);
    print(body);
    return await post(
        url + target, body: jsonEncode(body),
        headers: headers);
  }
}
