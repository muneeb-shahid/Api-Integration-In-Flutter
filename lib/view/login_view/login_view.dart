import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_view_controller/login_view_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewController loginViewController = Get.put(LoginViewController());
  
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Post Api"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: loginViewController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: loginViewController.emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: loginViewController.passwordController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      loginViewController.login(
                          loginViewController.emailController.text,
                          loginViewController.passwordController.text);
                    },
                    child: loginViewController.loading.value
                        ? CircularProgressIndicator()
                        : Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                "Login",
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
