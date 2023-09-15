import 'package:bottom/Screens/NotesScreen.dart';
import 'package:bottom/Models/DataModel.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:bottom/Screens/NewNoteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class search extends ConsumerStatefulWidget {
  search({super.key});

  @override
  ConsumerState<search> createState() => _searchState();
}

class _searchState extends ConsumerState<search> {
  List<DataModel> Notes = [];
  List<DataModel> notesList = [];
  int count = 0;

  void update(String value) {
    setState(() {
      notesList = Notes.where((e) =>
          (e.title.toLowerCase().contains(value.toLowerCase())) ||
          (e.note.toLowerCase().contains(value.toLowerCase()))).toList();
      count = notesList.length;
    });
  }

  Widget lBuilder() {
    return notesList.isNotEmpty
        ? ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: NewNote(
                            Note: notesList[index],
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                          ),
                          type: PageTransitionType.rightToLeft,
                        ));
                  },
                  child: Container(
                    key: ValueKey(notesList[index].id),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      notesList[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      notesList[index].note,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                formatterForDate.format(notesList[index].date),
                              ),
                              const Spacer(),
                              Text(
                                formatterForTime.format(notesList[index].date),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : Center(child: Text("No Results Found..!"));
  }

  @override
  Widget build(BuildContext context) {
    Notes = ref.watch(DataBaseProvider);

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  update(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Your Notes",
                ),
              ),
            )
          ],
        ),
        body: lBuilder());
  }
}
