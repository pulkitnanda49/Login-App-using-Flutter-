import 'package:http/http.dart';
import 'package:test_login1/Widgets/modals/login_modal.dart';
import 'dart:convert' show json;

final String api ='https://my-json-server.typicode.com/akashom53/Sample-Api/db';

class ApiClient {
  final Client client = Client();

  Future<Response> getScreens() async {
    return await client.get(api);
  }

  Future<LoginModel> getLoginModel() async {
    
    var response = await getScreens();
    return LoginModel.fromJson( json.decode(response.body)["screens"][0]);
  }
}