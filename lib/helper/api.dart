import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:admin_panel_flutter/helper/expections.dart';
import 'package:admin_panel_flutter/helper/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'http://localhost:2001/';

  Future<dynamic> getUsers() async {
    var responseJson;
    var _token = await getToken();
    var _headers = <String, String>{
      'Authorization': _token,
      'Content-Type': 'application/json'
    };
    try {
      final response =
          await http.get(Uri.parse(_baseUrl + 'test'), headers: _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson['users'];
  }

  Future<dynamic> login(String _email, String _password) async {
    var responseJson;
    var _body = jsonEncode({'email': _email, 'password': _password});
    var _headers = <String, String>{'Content-Type': 'application/json'};
    try {
      final response = await http.post(Uri.parse(_baseUrl + 'users/login'),
          body: _body, headers: _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    await setToken(responseJson['token']);
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            // ignore: lines_longer_than_80_chars
            'Error occured while connection with Server with StatusCode : ${response.statusCode}');
    }
  }
}
