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

  RxBool loading = false.obs;
  SignUp(String email, String password) async {
    loading.value = true;
    try {
      var response = await http
          .post(Uri.parse("https://reqres.in/api/register"), body: {
        "email": _emailController.text,
        "password": _passwordController.text
      });
      if (response.statusCode == 200) {
    loading.value = false;

        print("Account created successfully");
      } else {
    loading.value = false;

        print("Failed");
      }
    } catch (e) {
    loading.value = false;

      print(e.toString());
    }
  }
}
