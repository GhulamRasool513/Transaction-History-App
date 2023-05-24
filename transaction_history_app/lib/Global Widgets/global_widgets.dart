import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



//Loading Circle
class LoadingCircle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      duration: Duration(seconds: 2),
      size: 70.0,
      color: Color(0xFF0ED679),
    );
  }
}







