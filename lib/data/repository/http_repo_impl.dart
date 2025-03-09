//https://jsonplaceholder.typicode.com/posts
import 'dart:convert';

import 'package:flutter_univarsal_architecture/data/model/api_data_model.dart';
import 'package:flutter_univarsal_architecture/data/repository/http_repo.dart';
import 'package:flutter_univarsal_architecture/data/source/remote_source/http_web_service.dart';

class HttpRepoImpl extends HttpRepo{
  HttpWebService _httpWebService;
  HttpRepoImpl(this._httpWebService);



  @override
  Future<List<ApiDataModel>> getListData() async {
    final response=await _httpWebService.getRequest("https://jsonplaceholder.typicode.com/posts");
    if(response?.statusCode==200){
      print("reposne==${response?.body}");
      List<dynamic> decodeJson=jsonDecode(response!.body) as List ;
      List<ApiDataModel> parseData=decodeJson.map((e) => ApiDataModel.fromJson(e)).toList();
      return parseData;
    }
    return [];
  }}