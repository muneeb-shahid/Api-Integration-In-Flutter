import 'dart:io';

import 'package:api_integration/view/HomeView/home_view.dart';
import 'package:api_integration/view/LoginView/LoginView.dart';
import 'package:api_integration/view/PhotosView/PhotosView.dart';
import 'package:api_integration/view/PutApi/PutApi.dart';
import 'package:api_integration/view/SignUpView/SignUpView.dart';
import 'package:api_integration/view/delete%20api/delete%20api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new PostHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 790),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Api Integration',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: DeleteApi(),
        );
      },
    );
  }
}
