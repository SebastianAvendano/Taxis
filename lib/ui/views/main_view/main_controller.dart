import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class MainController {
  MainController();

  void init(BuildContext context) async {}

  @disposeMethod
  void dispose() {}
}
