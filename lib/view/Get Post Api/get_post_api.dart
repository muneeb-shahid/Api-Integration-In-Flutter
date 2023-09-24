import 'package:flutter/material.dart';
import '../../CRUD Api/Get Api/get_posts_api.dart';

class GetPostApi extends StatelessWidget {
  const GetPostApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Post Api"),
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
              }

              return const CircularProgressIndicator();
            },
          )),
        ],
      ),
    );
  }
}
