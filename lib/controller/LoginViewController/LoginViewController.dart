import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginViewController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final _emailController = TextEditingController();
  get emailController => _emailController;

  final _passwordController = TextEditingController();
  get passwordController => _passwordController;

  RxBool loading = false.obs;
  login(String email, String password) async {
    loading.value = true;
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": _emailController.text,
            "password": _passwordController.text
          });

      if (response.statusCode == 200) {
        loading.value = false;

        print("Login successfully");
        print(response.body);
      } else {
        loading.value = false;

        print("Login failed");
      }
    } catch (e) {
      loading.value = false;

      print(e.toString());
    }
  }
}
