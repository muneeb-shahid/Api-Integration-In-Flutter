import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../crud_api/get_api/get_posts_api.dart';
import '../../controller/home_view_controller/home_view_controller.dart';
import '../../model/post_model/post_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeView"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Title",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              postList[index].title.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Body",
                              style: TextStyle(fontSize: 30, color: Colors.red),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              postList[index].body.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                );

                // print(
                //   '${snapshot.error}',
                // );
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )),
        ],
      ),
    );
  }
}
