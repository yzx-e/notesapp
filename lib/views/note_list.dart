import 'package:flutter/material.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/views/note.dart';

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text('Generic Note App'),
        ),
      ),
      body: FutureBuilder(
        future: NoteProvider.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final notes = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Note(NoteMode.Editing, notes[index])));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20, left: 23.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _NoteTitle(notes[index]['title']),
                          Container(
                            height: 4,
                          ),
                          _NoteText(notes[index]['text'])
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: notes.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.brown[400],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Note(NoteMode.Adding, null)));
          },
          icon: Icon(Icons.add),
          label: Text('Add Note')),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
