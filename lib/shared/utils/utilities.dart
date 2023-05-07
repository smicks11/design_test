// ignore_for_file: unnecessary_null_comparison, null_check_always_fails

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double logicalHeight() {
  return WidgetsBinding.instance.window.physicalSize.height /
      WidgetsBinding.instance.window.devicePixelRatio;
}
double logicalWidth() {
  return WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}



