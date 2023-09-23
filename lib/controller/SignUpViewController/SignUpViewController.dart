import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class SignUpViewController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final _emailController = TextEditingController();
  get emailController => _emailController;

  final _passwordController = TextEditingController();
  get passwordController => _passwordController;

  login(String email, String password) async {
    try {
      var response = await http
          .post(Uri.parse("https://reqres.in/api/register"), body: {
        "email": _emailController.text,
        "password": _passwordController.text
      });
      if (response.statusCode == 200) {
        print("Account created successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
