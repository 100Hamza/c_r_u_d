import 'package:c_r_u_d/presentation/elements/customtext.dart';
import 'package:c_r_u_d/presentation/elements/navigation_dialog.dart';
import 'package:c_r_u_d/presentation/view/notes/notes_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../helper/navigation_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<DocumentSnapshot> allData = [];

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('this is init');
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print('this is build');
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              child: Icon(Icons.add),
              onTap: () {
                NavigationHelper.pushRoute(context, const NoteView());
              },
            )
          ],
          centerTitle: true,
          title: Text('Home'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: allData.isEmpty
              ? Center(child: Text('No Data Found'))
              : ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: allData[i]['Title'],
                                  size: 18,
                                ),
                                CustomText(
                                  text: allData[i]['Message'],
                                  size: 13,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      showNavigationDialog(context,
                                          message:
                                              'Are You sure you want to delete!',
                                          buttonText: 'Yes', navigation: () {
                                        FirebaseFirestore.instance
                                            .collection('Notes')
                                            .doc(allData[i]['docID'])
                                            .delete()
                                            .then((value) {
                                          Navigator.pop(context);
                                        });
                                      },
                                          secondButtonText: 'No',
                                          showSecondButton: true);
                                    },
                                    child: const Icon(Icons.delete)),
                                Icon(Icons.edit),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }

  fetchData() async {
    await FirebaseFirestore.instance
        .collection('Notes')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      allData.clear();
      snapshot.docs.forEach((element) {
        allData.add(element);
        setState(() {});
      });
    });
  }
}
