import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  // to make SignUpController callable
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data  from TextFields
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final fullName = TextEditingController();
  final religion = TextEditingController();
  final gender = TextEditingController();
  final sexualOrientation = TextEditingController();
  final birthday = TextEditingController();
  final interests = TextEditingController();
}