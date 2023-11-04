import 'dart:convert';
import 'package:http/http.dart' as http;

import 'TokenStorage.dart';
class CallApi{

  final String _url = 'https://quiz.fessage.com/api/v1/';

  Future<void> init() async {
    await getToken();
  }
  String? authToken;


  Future<void> getToken() async {
    final tokenStorage = TokenStorage();
    authToken = await tokenStorage.getAuthToken();
    print(authToken);
  }


  Future<http.Response> postData(data, apiUrl) async {
    print("URL: $_url$apiUrl");
    await init(); // Call init method to retrieve the authentication token
    return await http.post(

      Uri.parse(_url + apiUrl),
      body: jsonEncode(data),
      headers: await _setHeader(),
    );
  }

  //delete method for deleting data with id
  Future<http.Response> deleteData(apiUrl) async {
    await init(); // Call init method to retrieve the authentication token
    print("URL: $_url$apiUrl");
    return await http.delete(
      Uri.parse(_url + apiUrl),
      headers: await _setHeader(),
    );
  }

  Future<http.Response> getData(String apiUrl) async {
    await init(); // Call init method to retrieve the authentication token
    print("URL: $_url$apiUrl");
    return await http.get(
      Uri.parse(_url + apiUrl),
      headers: await _setHeader(),
    );
  }

  //put method for updating data
  Future<http.Response> putData(data, apiUrl) async {
    await init(); // Call init method to retrieve the authentication token
    return await http.put(
      Uri.parse(_url + apiUrl),
      body: jsonEncode(data),
      headers: await _setHeader(),
    );
  }



  Future<Map<String, String>> _setHeader() async {

    var headers = {
      'Content-type': 'application/vnd.api+json',
      'Accept': 'application/vnd.api+json',
    };

    if (authToken != null) {
      headers['Authorization'] = 'Bearer $authToken';
    }

    return headers;
  }
}