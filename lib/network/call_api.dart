import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

//this class to call api
class CallAPI {
  Future<Map> get(String url, {dynamic headers}) async {
    http.Response response = await http.get(url, headers: headers);

    return json.decode(response.body);
  }

  dynamic getWithoutHeader(String url) async {
    http.Response response = await http.get(url);
    return response;
  }

  dynamic post(String url, dynamic data, {dynamic headers}) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    return response;
  }


}
