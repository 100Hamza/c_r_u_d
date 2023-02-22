import 'package:c_r_u_d/helper/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Register You Account',
              size: 22.0,
              space: 2.0,
              textColor: Colors.black,
              weight: FontWeight.w900,
            ),
            SizedBox(
              height: 40.0,
            ),
            CustomeTextTField(
                controller: nameController,
                hint: 'Enter Name',
                label: 'Name',
                icon: Icons.person,

            ),
            SizedBox(
              height: 20.0,
            ),
            CustomeTextTField(
              controller: emailController,
              hint: 'Enter Email',
              label: 'Email',
              icon: Icons.email,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomeTextTField(
              controller: passController,
              hint: 'Enter You Password',
              label: 'Password',
              icon: Icons.lock,
              isPass: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomeTextTField(
              isPass: true,
              controller: confirmPassController,
              hint: 'Confirm Your Password',
              label: 'Confirm Password',
              icon: Icons.lock,
            ),
            SizedBox(
              height: 25,
            ),
            CustomButton(
              buttonName: 'SignUp',
              onPress: (){
                if(nameController.text.isEmpty)
                  {

                  }
                else if(emailController.text.isEmpty)
                  {

                  }
                else if(passController.text.isEmpty)
                  {

                  }
                else if(confirmPassController.text.isEmpty)
                  {

                  }
                else
                  {
                    _createaccount();
                    NavigationHelper.pushRoute(context, MyApp());
                  }
              },
            ),
            CustomButton(
              buttonName: 'Login',
              onPress: (){
                NavigationHelper.pushRoute(context, LoginView());
              },
            )
          ],
        ),
      ),
    );
  }

  _createaccount() async
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text).then((value) {
      var id = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection('user').doc(id).set({
        "name": nameController.text,
        "email": emailController.text,
        "password": passController.text,
        "joiningDate":DateTime.now(),
      });
    });
  }

}
