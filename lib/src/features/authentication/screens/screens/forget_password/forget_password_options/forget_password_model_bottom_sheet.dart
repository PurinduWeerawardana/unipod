import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'forget_password_button_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet (
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(kcrozDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kcrozForgetPasswordTitle, style: Theme.of(context).textTheme.headline2,),
            Text(kcrozForgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyText2,),
            const SizedBox(height: 30.0,),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mail_outline_rounded,
              title: kcrozEmail,
              subTitle: kcrozResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(height: 20.0,),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mobile_friendly_rounded,
              title: kcrozPhoneNo,
              subTitle: kcrozResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}