// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:design_test/shared/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../core/locator/locator.dart';
import 'app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(logicalWidth(), logicalHeight()),
      builder: (BuildContext context, Widget? child) => MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.navRoute,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: ThemeData(
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}
