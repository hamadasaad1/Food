
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/model/meal_details_model.dart';
import 'package:food/network/call_api.dart';
import 'package:food/network/constant.dart';
import 'package:http/http.dart' as http;

class MealsDetailsProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  MealDetailsModel _list;

  get getMealModelDetailsData => _list;

  Future<bool> callAPIForMealDetailsData(String name) async {
    _isLoading = true;
    notifyListeners();
    //https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
    String query = "?s=$name";
    print(BASE_URL + SEARCH + query);
    http.Response response =
    await CallAPI().getWithoutHeader(BASE_URL + SEARCH + query);
    int statusCode = response.statusCode;
    print("callAPIForMealDetailsData" + statusCode.toString());
    print("callAPIForMealDetailsData" + response.body.toString());
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
      mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
      return false;
    } else {
      _isLoading = false;
      _list = MealDetailsModel.fromJson(json.decode(response.body));
      notifyListeners();
      return true;
    }
  }
}
