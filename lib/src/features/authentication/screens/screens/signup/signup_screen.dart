import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kcroz/src/common_widgets/form/form_header_widget.dart';
import 'package:kcroz/src/common_widgets/text_field_input.dart';
import 'package:kcroz/src/constants/image_string.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/features/authentication/screens/screens/create_profile/create_profile.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/widgets/signup_footer_widget.dart';
import '../../controllers/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kcrozDefaultSize),
            child: Column(
              children:  [
                // Section - 1 [ Header ]
                const FormHeaderWidget(
                    image: kcrozWelcomeScreenImage,
                    title: kcrozSignUpTitle,
                    subTitle: kcrozSignUpSubTitle,
                    imageHeight: 0.2,
                ),

                // Section - 2 [ Form ]
                Container(
                  padding: const EdgeInsets.symmetric(vertical: kcrozDefaultSize - 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kcrozDefaultSize - 20,),
                      TextFieldInput(
                        textEditingController: controller.email,
                        labelText: kcrozEmail,
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: kcrozEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: kcrozDefaultSize - 20,),
                      TextFieldInput(
                        textEditingController: controller.phoneNo,
                        labelText: kcrozPhoneNo,
                        prefixIcon: const Icon(Icons.numbers),
                        hintText: kcrozPhoneNo,
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(height: kcrozDefaultSize - 20,),
                      TextFieldInput(
                        textEditingController: controller.password,
                        labelText: kcrozPassword,
                        prefixIcon: const Icon(Icons.fingerprint),
                        hintText: kcrozPassword,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: kcrozDefaultSize - 10,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed:  () {
                              if(controller.email.text.isNotEmpty
                                  && controller.phoneNo.text.isNotEmpty
                                  && controller.password.text.isNotEmpty){
                                Get.to(() => const CreateProfile());
                              }else {
                                Get.snackbar("Error", "Please Fill empty Fields",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.redAccent.withOpacity(0.2),
                                    colorText: Colors.red);
                              }
                            },
                            child: Text(kcrozSignup.toUpperCase())),
                      )
                    ],
                  ),
                ),
                // Section - 3 [ Footer ]
                const SignUpFooterWidget()
              ],
            ),
          ),
        )
      ),
    );
  }
}



