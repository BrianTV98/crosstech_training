import 'package:flutter/material.dart';

extension BuilderContextExtension on BuildContext {
  double get widthScreen => MediaQuery.of(this).size.width;
  double get heightScreen => MediaQuery.of(this).size.height;
}
