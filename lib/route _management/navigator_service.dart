import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NavigatorService{
  NavigatorService._privateConstructor();
  static NavigatorService instance=NavigatorService._privateConstructor();


  final GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();

  dynamic toRoute(String navigationName,[dynamic argumentsData]){
     navigatorKey.currentState?.pushNamed(navigationName,arguments:argumentsData );
   }

}