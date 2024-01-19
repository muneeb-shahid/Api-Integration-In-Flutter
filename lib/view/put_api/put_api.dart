import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/put_api_controller/put_api_controller.dart';

class PutApi extends StatelessWidget {
  const PutApi({super.key});

  @override
  Widget build(BuildContext context) {
    PutApiController putApiController = Get.put(PutApiController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Put Api"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: putApiController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: putApiController.emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: putApiController.passwordController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      putApiController.putApi(
                          putApiController.emailController.text.toString(),
                          putApiController.passwordController.text.toString());
                    },
                    child: putApiController.loading.value
                        ? CircularProgressIndicator()
                        : Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                "Update",
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
