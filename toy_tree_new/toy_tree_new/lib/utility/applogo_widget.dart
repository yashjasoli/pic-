

import 'package:flutter/material.dart';
import 'package:toy_tree_new/utility/consts/consts.dart';
import 'package:toy_tree_new/utility/consts/images.dart';

Widget applogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
Widget applogoWidget2() {
  return Image.asset(icAppLogo)
      .box
      .transparent
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
