import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kcroz/src/constants/image_string.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';

import '../../../../../../common_widgets/form/form_header_widget.dart';
import '../forget_password_otp/otp_screen.dart';


class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kcrozDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: kcrozDefaultSize * 4,),
                const FormHeaderWidget(
                  image: kcrozForgetPasswordImage,
                  title: kcrozForgetPasswordTitle,
                  subTitle: kcrozForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  imageHeight: 0.3,
                  textAlign: TextAlign.center,
                  heightBetween: 20.0,
                ),
                const SizedBox(height: kcrozDefaultSize,),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(kcrozEmail),
                          hintText: kcrozEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: kcrozDefaultSize,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const OTPScreen());
                            },
                            child: const Text(kcrozNext)
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
