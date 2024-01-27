import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PutApiController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final _emailController = TextEditingController();
  get emailController => _emailController;

  final _passwordController = TextEditingController();
  get passwordController => _passwordController;

  RxBool loading = false.obs;
  putApi(String title, String body) async {
    try {
      var response = await http.put(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
          body: {
            "title": _emailController.text,
            "body": _passwordController.text
          });

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Update Successfully");
          print(response.body);
        }
      } else {
        if (kDebugMode) {
          print("failed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
