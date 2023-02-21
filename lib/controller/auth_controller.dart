import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController rationIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future loginUser() async {
    const url = 'http://127.0.0.1:8000/api/user/login/';

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "email": usernameController.text,
          "rationId": rationIdController.text,
          "password": passwordController.text,
        }));
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      // save this token in shared prefrences and make user logged in and navigate
      print(loginArr);
    } else {
      print("Server Error");
    }
  }
}

class regAuthController {
  TextEditingController emailController = TextEditingController();
  TextEditingController rationIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController policyController = TextEditingController();
  Future loginUser() async {
    const url = 'http://127.0.0.1:8000/api/user/register/';

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "email": emailController.text,
          "rationId": rationIdController.text,
          "password": passwordController.text,
          "password": passwordController.text,
          "tc": policyController
        }));
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      // save this token in shared prefrences and make user logged in and navigate
      print(loginArr);
    } else {
      print("Server Error");
    }
  }
}
