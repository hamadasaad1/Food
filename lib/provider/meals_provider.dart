import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/model/meals_model.dart';
import 'package:food/network/call_api.dart';
import 'package:food/network/constant.dart';
import 'package:http/http.dart' as http;

class MealsProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  MealModel _list;

  get getMealModelData => _list;

  Future<Null> callAPIForMealData(String name) async {
    _isLoading = true;
    notifyListeners();
    //https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
    String query = "?c=$name";
    print(BASE_URL + FILTER + query);
    http.Response response =
        await CallAPI().getWithoutHeader(BASE_URL + FILTER + query);
    int statusCode = response.statusCode;
    print("callAPIForMealData" + statusCode.toString());
    print("callAPIForMealData" + response.body.toString());
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
    } else {
      _isLoading = false;
      _list = MealModel.fromJson(json.decode(response.body));
      notifyListeners();
    }
  }
}
