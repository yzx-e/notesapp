import 'package:flutter/material.dart';
import 'package:note_app/views/note_list.dart';
import 'package:note_app/inherited_widgets/note_inherited_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: 'Generic Note App',
        theme: ThemeData(
          primaryColor: Colors.brown[400],
        ),
        home: NoteList(),
      ),
    );
  }
}
