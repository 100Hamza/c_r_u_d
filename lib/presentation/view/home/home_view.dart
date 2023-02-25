import 'package:c_r_u_d/presentation/view/notes/notes_view.dart';
import 'package:flutter/material.dart';

import '../../../helper/navigation_helper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.add),
            onTap: (){
              NavigationHelper.pushRoute(context, const NoteView());
            },
          )
        ],
        centerTitle: true,
        title: Text('Home'),),
      body: Text("This is Home Screen"),
    );
  }
}
