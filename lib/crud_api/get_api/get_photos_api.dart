import 'dart:convert';

import '../../model/photos_model/photos_model.dart';
import 'package:http/http.dart' as http;

List<PhotosModel> photosModel_List = [];
Future<List<PhotosModel>> getPhotosModel() async {
  var response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    for (var i in data) {
      photosModel_List.add(PhotosModel.fromJson(i));
    }
    return photosModel_List;
  } else {
    return photosModel_List;
  }
}
