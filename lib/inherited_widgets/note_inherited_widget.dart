import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {'title': 'jjjjjjjjjjjjjjjjjjjjjjjj', 'text': 'hjfhnhgmgjfhgjfghjfghjgfhj'},
    {'title': 'hhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'text': 'cbbvxcvbcvxvbbxvccxcvc'},
    {'title': 'kkkkkkkkkkkkkkkkkkkkkkkk', 'text': 'yiouyuiuoyuiyyuyiu'}
  ];

  NoteInheritedWidget(Widget child) : super(child: child);
  // inheritFromWidgetOfExactType
  static NoteInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>();
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}
