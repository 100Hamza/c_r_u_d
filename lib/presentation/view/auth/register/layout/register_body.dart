import 'package:c_r_u_d/helper/navigation_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../main.dart';
import '../../../../elements/custom_button.dart';
import '../../../../elements/custome_text_field.dart';
import '../../../../elements/customtext.dart';
import '../../login/login_view.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmPassController = TextEditingController();
bool isLoading = false;

class _RegisterBodyState extends State<RegisterBody> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(nameController.text);
    return LoadingOverlay(
      isLoading: isLoading,
      child: Center(
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
                text: 'Register You Account',
                size: 22.0,
                space: 2.0,
                textColor: Colors.black,
                weight: FontWeight.w900,
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomeTextTField(
                controller: nameController,
                hint: 'Enter Name',
                label: 'Name',
                icon: Icons.person,
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
              const SizedBox(
                height: 20.0,
              ),
              CustomeTextTField(
                controller: passController,
                hint: 'Enter You Password',
                label: 'Password',
                icon: Icons.lock,
                isPass: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomeTextTField(
                isPass: true,
                controller: confirmPassController,
                hint: 'Confirm Your Password',
                label: 'Confirm Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                buttonName: 'SignUp',
                onPress: () {
                  if (nameController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Name Can Not be empty');
                  } else if (emailController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'email Can Not be empty');
                  } else if (passController.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Password Can Not be empty');
                  } else if (confirmPassController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Confirm Password Can Not be empty');
                  } else if (confirmPassController.text !=
                      passController.text) {
                    Fluttertoast.showToast(
                        msg: 'password does not match');
                  } else {
                    _createaccount();

                  }
                },
              ),
              CustomButton(
                buttonName: 'Login',
                onPress: () {
                  NavigationHelper.pushRoute(context, const LoginView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _createaccount() async {
    setLoadingTrue();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text)
        .then((value) {
      var id = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('user').doc(id).set({
        "name": nameController.text,
        "email": emailController.text,
        "password": passController.text,
        "joiningDate": DateTime.now(),
      }).whenComplete(() {
        setLoadingFalse();
        NavigationHelper.pushRoute(context, const MyApp());
      });
    });
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
