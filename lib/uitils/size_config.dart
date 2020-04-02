import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeWidth = 0;
  static double _blockSizeHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static double heightScreenSize;
  static double widthScreenSize;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
/*AIzaSyA4GTmv6GMGzxVjw5U0_ORqtVIQtn69o3k*/
/*AIzaSyA4GTmv6GMGzxVjw5U0_ORqtVIQtn69o3k*/
    _blockSizeWidth = _screenWidth / 100;
    _blockSizeHeight = _screenHeight / 100;
    heightScreenSize=_screenHeight;
    widthScreenSize=_screenWidth;
    textMultiplier = _blockSizeHeight;
    imageSizeMultiplier = _blockSizeWidth;
    heightMultiplier = _blockSizeHeight;
    widthMultiplier = _blockSizeWidth;

    print(_blockSizeHeight.toString());
    print(_blockSizeWidth.toString());
    print(_screenHeight.toString());
    print(_screenWidth.toString());
  }
}
