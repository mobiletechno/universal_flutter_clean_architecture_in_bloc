import 'package:http/http.dart' as http;

class HttpWebService{

  Future<http.Response?> getRequest(String url) async {
    try{
       final response=await http.get(Uri.parse(url));
       if(response.statusCode==200){
         return response;
       }
    }
    catch(e){
    print("http issue===>$e");
    return null;
   }
  }
}