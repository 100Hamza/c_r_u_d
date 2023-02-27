import 'package:c_r_u_d/presentation/elements/custom_button.dart';
import 'package:c_r_u_d/presentation/view/notes/layout/widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({Key? key}) : super(key: key);

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.uid);
    return LoadingOverlay(
      isLoading: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Custom_TextField(
                label: "Title",
                hint: "Enter title of the note",
                controller: titleController),
            const SizedBox(
              height: 10,
            ),
            Custom_TextField(
                label: "Message",
                hint: "Enter Notes Message",
                maxLines: 10,
                controller: messageController),
            CustomButton(
              buttonName: 'Add Notes',
              onPress: () {
                _addNotes();
              },
            )
          ],
        ),
      ),
    );
  }

  _addNotes() async {
    isLoadingTrue();
    print("Loading is True");
    var id = FirebaseAuth.instance.currentUser!.uid;
    var docID = FirebaseFirestore.instance.collection('Notes').doc().id;
    await FirebaseFirestore.instance.collection('Notes').doc(docID).set({
      "Title": titleController.text,
      "Message": messageController.text,
      "userId": id,
      "docID": docID,
    }).whenComplete(() {
      isLoadingFalse();
      titleController.clear();
      messageController.clear();
      Fluttertoast.showToast(msg: 'Notes Upload Successfully');
      Navigator.pop(context);

      // NavigationHelper.pushRoute(context, const Home());
    });
  }

  void isLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  void isLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }
}
