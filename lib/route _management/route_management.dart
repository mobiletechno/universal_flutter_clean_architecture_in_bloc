import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import '../presentation/Home/view.dart';
import '../presentation/view_item/view.dart';

class RouteManagement{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments=settings.arguments;
    switch(settings.name){
      case "home":
        return MaterialPageRoute(builder: (context) => MyHomePage(title: 'home',));
      case "itemView":
        return MaterialPageRoute(builder: (context) => ItemPage(title: 'Item',previousData: arguments.toString()));

    }

    return MaterialPageRoute(builder: (context) => Material(child: Text("no data") ));


  }
}