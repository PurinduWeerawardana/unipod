import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcroz/src/features/authentication/screens/models/user_model.dart';
import 'package:kcroz/src/services/firebase_auth_methods.dart';
import 'package:kcroz/src/services/user_repository.dart';

import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_string.dart';
import '../../../controllers/signup_controller.dart';


class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpController controller = Get.put(SignUpController());

  void signUpUser() async{
    // final user = UserModel(
    //     fullName: controller.fullName.text.trim(),
    //     email: controller.email.text.trim(),
    //     password: controller.password.text.trim(),
    //     phoneNo: controller.phoneNo.text.trim());
    // await UserRepository.instance.createUser(user);
    // FirebaseAuthMethods().signUpWithEmail(
    //     email: controller.email.text,
    //     fullName: controller.fullName.text,
    //     phoneNo: controller.phoneNo.text,
    //     password: controller.password.text,
    //     context: context);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: kcrozDefaultSize - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(kcrozFullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(kcrozEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(kcrozPhoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 20,),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(kcrozPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: kcrozDefaultSize - 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed:  signUpUser,
                  child: Text(kcrozSignup.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
