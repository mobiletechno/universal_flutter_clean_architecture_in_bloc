import '../model/api_data_model.dart';

abstract class HttpRepo{
  Future <List<ApiDataModel>> getListData();
}