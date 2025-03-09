class ApiDataModel{
  int? userId;
  String? title;
  String? body;

  ApiDataModel(this.userId,this.title,this.body);
  ApiDataModel.fromJson(dynamic Map){
    userId=Map["userId"];
    title=Map["title"];
    body=Map["body"];
  }

}
