import 'package:c_r_u_d/presentation/view/auth/login/login_view.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase CRUD' ),
          shadowColor: Colors.blue,
        ),
        body:  const LoginView(),
      ),
    );
  }
}
