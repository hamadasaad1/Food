import 'package:flutter/material.dart';
import 'package:food/enums/connectivity_status.dart';
import 'package:food/provider/connectivity_provider.dart';
import 'package:food/provider/home_provider.dart';
import 'package:food/ui/home_page.dart';
import 'package:food/ui/home_task_page.dart';
import 'package:food/uitils/app_theme.dart';
import 'package:food/uitils/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*StreamProvider<ConnectivityStatus>(
      builder: (_) => ConnectivityService().connectionStatusController,
      child: */
        MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                home: HomeTaskPage(),
              );
            },
          );
        },
      ),
    );
/*      ),
    );*/
  }
}
