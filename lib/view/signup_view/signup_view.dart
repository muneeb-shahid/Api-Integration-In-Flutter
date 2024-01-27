import 'package:api_integration/view_model/signup_view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpViewController signUpViewController = Get.put(SignUpViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp Post Api"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: signUpViewController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: signUpViewController.emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: signUpViewController.passwordController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      signUpViewController.SignUp(
                          signUpViewController.emailController.text,
                          signUpViewController.passwordController.text);
                    },
                    child: signUpViewController.loading.value
                        ? CircularProgressIndicator()
                        : Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                  );
                })
              ],
            ),
          ),
        )));
  }
}
