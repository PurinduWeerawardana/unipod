import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/common_widgets/text_field_input.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';
import 'package:kcroz/src/features/core/screens/map/home_page_map.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../services/firebase_auth_methods.dart';
import '../../controllers/login_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'widgets/ login_footer_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  bool _isLoading = false;

  void loginUser() async{
    setState(() {
      _isLoading = true;
    });
    String result = await FirebaseAuthMethods().loginWithEmail(
        email: controller.email.text,
        password: controller.password.text,
        context: context);

    if(result.substring(0,5) != "Error"){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePageMap()));

    } else {
      Get.snackbar("Error", result.substring(8),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.red);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // To make the layout scrollable
        body: SingleChildScrollView(
            child: Container(
              padding:  const EdgeInsets.all(kcrozDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  // Section - 1
                  const FormHeaderWidget(
                    image: kcrozWelcomeScreenImage,
                    title: kcrozLoginTitle,
                    subTitle: kcrozLoginTitle,
                    imageHeight: 0.2,
                  ),

                  // Section - 2
                  Container(
                    padding:  const EdgeInsets.symmetric(vertical: kcrozFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldInput(
                          textEditingController: controller.email,
                          hintText: kcrozEmail,
                          labelText: kcrozEmail,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon : const Icon(Icons.person_outline_outlined),
                        ),

                         const SizedBox(height: kcrozFormHeight - 20,),
                        TextFieldInput(
                          textEditingController: controller.password,
                          labelText: kcrozPassword,
                          hintText: kcrozPassword,
                          isPassword: true,
                          textInputType: TextInputType.text,
                          prefixIcon:  const Icon(Icons.fingerprint),
                          // suffixIcon: IconButton(onPressed: loginUser, icon:  const Icon(Icons.remove_red_eye_sharp)),),
                        ),
                         const SizedBox(height: kcrozFormHeight - 20,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: const ButtonStyle(

                            ),
                            onPressed: () {
                              ForgetPasswordScreen.buildShowModalBottomSheet(context);
                            },
                            child:  const Text(kcrozForgetPassword)),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: loginUser,
                                child: Text(kcrozLogin.toUpperCase())
                            )
                        )
                      ],
                    ),
                  ),

                  // Section - 3
                  const LoginFooterWidget()

                ],
              ),
            ),
        )
      ),
    );
  }
}