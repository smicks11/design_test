import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../app/bottom_navigation.dart';

BuildContext? locatorContext;

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
];
