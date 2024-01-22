import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/helpers/prints.dart';

class AuthRequest {
  late BuildContext context;
  AuthRequest({
    required this.context,
  });
  Future login({
    required username,
    required password,
  }) async {
    var url = 'http://10.0.2.2:8000/api/login';
    Map<String, String> headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/x-www-form-urlencoded",
      "Connection": "Keep-Alive",
      "Accept-Encoding": "gzip, deflate, br",
    };
    bool authenticated = false;
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: {
        'user_name': username,
        'password': password,
      },
    ).then(
      (http.Response response) {
        printWarning(response.body);
        printWarning(response.statusCode);
        if (response.statusCode == 200) {
          authenticated = true;
        }
      },
    );
    return authenticated;
  }

  Future register({
    required username,
    required email,
    required password,
  }) async {
    var url = 'http://10.0.2.2:8000/api/register';
    Map<String, String> headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/x-www-form-urlencoded",
      "Connection": "Keep-Alive",
      "Accept-Encoding": "gzip, deflate, br",
    };
    bool authenticated = false;

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: {
        'user_name': username,
        'email': email,
        'password': password,
      },
    ).then(
      (http.Response response) {
        printWarning(response.body);
        printWarning(response.statusCode);
        if (response.statusCode == 200) {
          authenticated = true;
        }
      },
    );
    return authenticated;
  }
}
