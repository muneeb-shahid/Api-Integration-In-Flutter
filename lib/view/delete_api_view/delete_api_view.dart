import 'package:api_integration/view_model/delete_api_view_model/delete_api_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteApi extends StatelessWidget {
  const DeleteApi({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteApiController deleteApiController = Get.put(DeleteApiController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Put Api"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: deleteApiController.formKey,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        deleteApiController.deleteApi();
                      },
                      child: Center(child: Text("Delete Api"))),
                ],
              )),
        )));
  }
}
