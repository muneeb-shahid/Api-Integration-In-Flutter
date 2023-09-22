import 'package:get/get.dart';

import '../../CRUD Api/Get Api/get_posts_api.dart';

class HomeViewController extends GetxController {
  @override
  void onInit() {
    getPostApi();

    super.onInit();
  }
}
