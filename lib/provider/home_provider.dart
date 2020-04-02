import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/model/categories_model.dart';
import 'package:food/network/call_api.dart';
import 'package:food/network/constant.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  CategoriesModel _list;

  get getCategoriesModelData => _list;

  Future<Null> callAPIForCategoriesData() async {
    _isLoading = true;
    notifyListeners();

    http.Response response =
        await CallAPI().getWithoutHeader(BASE_URL + CATEGORIES);
    int statusCode = response.statusCode;
    print("callAPIForCategoriesData" + statusCode.toString());
    print("callAPIForCategoriesData" + response.body.toString());
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
    } else {
      _isLoading = false;
      _list = CategoriesModel.fromJson(json.decode(response.body));
      notifyListeners();
    }
  }

  Future<bool> callAPIForXmlData() async {
    _isLoading = true;
    notifyListeners();

    Xml2Json xml2json = new Xml2Json(); //Make an instance.
    http.Response response = await CallAPI().getWithoutHeader(
        'http://skillzycp.com/api/UserApi/getOneOccasion/389/0');
    int statusCode = response.statusCode;
    print("callAPIForCategoriesData" + statusCode.toString());
    print("callAPIForCategoriesData" + response.body.toString());
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      print('Data is Null 1100');
      _isLoading = false;
      notifyListeners();
      return false;
    } else {
      try {
        xml2json.parse(response.body);
        var jsonData = xml2json.toGData();
        var data = json.decode(jsonData);
        print("Data== " + data);
        _isLoading = false;
        //  _list = CategoriesModel.fromJson(json.decode(response.body));
        notifyListeners();
        return true;
      } catch (e) {
        print("Error 1020= " + e.toString());
      }
    }
  }
}
