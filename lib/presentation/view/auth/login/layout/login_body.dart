import 'package:c_r_u_d/presentation/elements/custom_button.dart';
import 'package:c_r_u_d/presentation/elements/custome_text_field.dart';
import 'package:c_r_u_d/presentation/elements/customtext.dart';
import 'package:c_r_u_d/presentation/elements/navigation_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';

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
bool isLoading = false;

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        body: Center(
        child: SingleChildScrollView(
        child: Column(
        children: [
        Image.asset(
        'assets/images/Logo.png',
        height: 100,
        width: 100,
      ),
      const SizedBox(
        height: 15,
      ),
      CustomText(
        text: 'Login',
        size: 22.0,
        space: 2.0,
        textColor: Colors.black,
        weight: FontWeight.w900,
      ),
      const SizedBox(
        height: 80.0,
      ),
      const SizedBox(
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
      const SizedBox(
        height: 50,
      ),
      CustomButton(
        buttonName: 'Login',
        onPress: () {
          if (emailController.text.isEmpty) {
            Fluttertoast.showToast(msg: 'Email  Can Not be empty');
          } else if (passController.text.isEmpty) {
            Fluttertoast.showToast(msg: 'Password  Can Not be empty');
          } else {
            _login();
          }
        },
      ),
      CustomButton(
        buttonName: 'SigUp',
        onPress: () {
          NavigationHelper.pushRoute(context, const RegisterView());
        },
      )
      ],
    ),)
    ,
    )
    ,
    )
    ,
    );
  }

  _login() async {
    setLoadingTrue();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passController.text)
          .then((value) {
        setLoadingFalse();
        NavigationHelper.pushRoute(context, const Home());
      });
    } catch (e) {
      setLoadingFalse();
      showNavigationDialog(context,
          message: e.toString(),
          buttonText: 'Okay', navigation: () {
           Navigator.pop(context);
          }, showSecondButton: false, secondButtonText: 'No');
    }
  }

  void setLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  void setLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }
}
