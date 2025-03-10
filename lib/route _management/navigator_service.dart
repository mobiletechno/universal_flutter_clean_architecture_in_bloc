import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NavigatorService{
  NavigatorService._privateConstructor();
  static NavigatorService instance=NavigatorService._privateConstructor();


  final GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();

  dynamic toRoute(String navigationName,[dynamic argumentsData]){
     navigatorKey.currentState?.pushNamed(navigationName,arguments:argumentsData );
   }
  dynamic routeToRemoveUntil(String route, bool isRemoved, [dynamic arguments]) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => isRemoved,arguments: arguments);
  }

  void showCustomDialog(String title,Widget content,[bool? isOkenabled]) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context, // Use navigatorKey
      builder: (context) {
        return AlertDialog(

          title: Text(isOkenabled==true?title:""),
          content: content,
          actions: [
            isOkenabled==true?TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: Text("OK"),
            ):SizedBox(),
          ],
        );
      },
    );
  }

  void showCustomSnackbar(String message) {

    ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }
  dynamic goBack() {
    return navigatorKey.currentState?.pop(true);
  }
}