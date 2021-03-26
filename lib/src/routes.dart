import 'package:driver_app/src/pages/display.dart';
import 'package:driver_app/src/pages/home.dart';
import 'package:flutter/material.dart' show WidgetBuilder;

class MyRouter {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (_) => Home(),
  };

  static Map<String, WidgetBuilder> get routes => _routes;
}