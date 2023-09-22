import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/PostModel/post_model.dart';

List<PostModel> postList = [];
Future<List<PostModel>> getPostApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  final data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    postList.clear();
    for (var i in data) {
      postList.add(PostModel.fromJson(i));
    }
    return postList;
  } else {
    
    return postList;
  }
}
