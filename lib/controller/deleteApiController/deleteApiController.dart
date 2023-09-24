import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/PostModel/post_model.dart';
import '../../model/PutModel/PutModel.dart';
import 'package:http/http.dart' as http;

class DeleteApiController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final _emailController = TextEditingController();
  get emailController => _emailController;

  final _passwordController = TextEditingController();
  get passwordController => _passwordController;

  RxBool loading = false.obs;
  deleteApi() async {
    try {
      var response = await http.delete(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      );

      if (response.statusCode == 200) {
        print("delete Successfully");
        print(response.body);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
