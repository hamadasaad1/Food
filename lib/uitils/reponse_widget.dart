import 'package:flutter/cupertino.dart';
import 'package:food/uitils/size_config.dart';


//this class for responsive ui for all device
class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landScapeLayout;

  ResponsiveWidget(this.portraitLayout, this.landScapeLayout);

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isPortrait && SizeConfig.isMobilePortrait) {
      return portraitLayout;
    } else {
      return landScapeLayout ??
          portraitLayout; //this to when landscape = null using portrait
    }
  }
}
