import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter_univarsal_architecture/data/repository/http_repo_impl.dart';
import 'package:flutter_univarsal_architecture/route%20_management/navigator_service.dart';
import 'package:flutter_univarsal_architecture/utils/gobal_timer.dart';

import '../../data/repository/http_repo.dart';
import '../../data/source/remote_source/http_web_service.dart';
import '../home/bloc_events.dart';
import 'bloc_events.dart';




class ItemViewModel{
  late AnimationController controller;
  StreamSubscription<int>? subscription;
   final streamController  = StreamController<ItemState>();
   Stream<ItemState> get streamState => streamController.stream;
initialPage(){
   subscription  = GlobalTimer.instance.timerStream.listen((value) {
    print("Timer: $value");
    streamController.sink.add(ListenState(value));
    // Stop timer after 5 seconds
    // if (value == 5) {
    //   GlobalTimer.instance.stop();
    //   subscription?.cancel();
    //   print("Timer Stopped");
    // }
  });

}



}