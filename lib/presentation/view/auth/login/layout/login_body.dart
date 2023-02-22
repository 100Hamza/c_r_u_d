import 'package:c_r_u_d/presentation/elements/custom_button.dart';
import 'package:c_r_u_d/presentation/elements/custome_text_field.dart';
import 'package:c_r_u_d/presentation/elements/customtext.dart';
import 'package:flutter/material.dart';

import '../../../../../helper/navigation_helper.dart';
import '../../home/home_view.dart';
import '../../register/resigter_view.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController passController = TextEditingController();
TextEditingController emailController = TextEditingController();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 15,),
            CustomText(
              text: 'Login',
              size: 22.0,
              space: 2.0,
              textColor: Colors.black,
              weight: FontWeight.w900,
            ),
            SizedBox(height: 80.0,),
            SizedBox(
              height: 20.0,
            ),
            CustomeTextTField(
              controller: emailController,
              hint: 'Enter Email',
              label: 'Email',
              icon: Icons.email,
            ),
            CustomeTextTField(
                controller: passController,
                hint: 'Enter Password',
                label: 'Password',
                icon: Icons.person,
                isPass: true),
            SizedBox(height: 50,),
            CustomButton(
              buttonName: 'Login',
              onPress: (){
                NavigationHelper.pushRoute(context, Home());
              },
            ),
            CustomButton(
              buttonName: 'SigUp',
              onPress: (){
                NavigationHelper.pushRoute(context, RegisterView());
              },
            )
          ],
        ),
      ),
    );
  }
}
