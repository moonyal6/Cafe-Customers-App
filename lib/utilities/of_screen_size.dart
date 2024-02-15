import 'package:flutter/material.dart';

double ofScreenWidth(context, percent) {
  return MediaQuery.of(context).size.width * percent;
}

double ofScreenHeight(context, percent) {
  return MediaQuery.of(context).size.height * percent;
}