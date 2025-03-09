import 'package:flutter_univarsal_architecture/data/model/api_data_model.dart';

sealed class HomeState{

}
class ListState extends HomeState{
   List<ApiDataModel> dataList=[];
  ListState(this.dataList);
}
class LoadingState extends HomeState{
  bool isLoading=false;
  LoadingState(this.isLoading);
}