import 'package:flutter/material.dart';
import 'package:food/enums/connectivity_status.dart';
import 'package:food/uitils/const_color.dart';
import 'package:provider/provider.dart';

//this class to check connection  and change between Ui
class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }

    return Opacity(
      opacity: 0.6,
      child: Center(
        child: Text('No internet Connection ',   style: TextStyle(
            color: AccentColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),),
      ),
    );
  }
}
