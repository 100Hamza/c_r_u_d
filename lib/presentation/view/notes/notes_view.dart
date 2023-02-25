import 'package:c_r_u_d/presentation/view/notes/layout/widgets/notes_body.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Notes")),
      body: const NotesBody(),
    );
  }
}
