import 'package:flutter/material.dart';

import '../../../../../../constants/sizes.dart';


class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    Key? key,
    required this.buttonIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  final IconData buttonIcon;
  final String title,subTitle;
  final VoidCallback onTap;  // void call back is a button clickable


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kcrozDefaultSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(buttonIcon, size: 60.0,),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6 ,),
                Text(subTitle, style: Theme.of(context).textTheme.bodyText2 ,),
              ],
            )
          ],
        ),
      ),
    );
  }
}