import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcroz/src/constants/sizes.dart';
import 'package:kcroz/src/constants/text_string.dart';


class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kcrozDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kcrozOTPTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0
              ),
            ),
            Text(
              kcrozOTPSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 40.0,),
            const Text(
              "$kcrozOTPMessage support@coding.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0,),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              // because OTP send by the firebase has 6 digits
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                // OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: kcrozDefaultSize,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // if the field didn't call automatically onSubmit
                    // OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text(kcrozNext)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
