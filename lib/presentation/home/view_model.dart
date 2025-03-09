import 'dart:async';

import 'package:flutter_univarsal_architecture/data/repository/http_repo_impl.dart';
import 'package:flutter_univarsal_architecture/route%20_management/navigator_service.dart';
import 'package:flutter_univarsal_architecture/utils/gobal_timer.dart';

import '../../data/repository/http_repo.dart';
import '../../data/source/remote_source/http_web_service.dart';
import '../home/bloc_events.dart';




class HomeViewModel{
  late HttpRepo httprepo ;
  final streamController  = StreamController<HomeState>();
   Stream<HomeState> get streamState => streamController.stream;

   Future<void> initialPage() async {
     httprepo=HttpRepoImpl(HttpWebService());
     streamController.sink.add(LoadingState(true));
     final result=await httprepo.getListData();
     if(result!=null){
       streamController.sink.add(ListState(result));
     }
   }

  void goToItem(String itemData) {
    GlobalTimer.instance.start();
     NavigatorService.instance.toRoute("itemView",itemData);
  }

}