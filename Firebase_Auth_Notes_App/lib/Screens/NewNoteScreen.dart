import 'package:bottom/Models/DataModel.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewNote extends ConsumerStatefulWidget {
  final DataModel? Note;
  final Color? color;
  NewNote({
    this.Note,
    this.color,
    super.key,
  });

  @override
  ConsumerState<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends ConsumerState<NewNote> {
  @override
  Widget build(BuildContext context) {
    final noteController = widget.Note == null
        ? TextEditingController()
        : TextEditingController(text: widget.Note!.note);
    final titleController = widget.Note == null
        ? TextEditingController()
        : TextEditingController(text: widget.Note!.title);
    bool _isSaved = false;
    void _dialoge() {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Warning"),
                actions: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Please Enter Some Text",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ));
    }

    void save() async {
      if (noteController.text.isEmpty || titleController.text.isEmpty) {
        _dialoge();
      }
      if (noteController.text.isNotEmpty && titleController.text.isNotEmpty) {
        if (widget.Note == null) {
          ref.read(DataBaseProvider.notifier).addNote(
                DataModel(
                    id: uuid.v4(),
                    date: DateTime.now(),
                    title: titleController.text,
                    note: noteController.text),
              );
        }
        if (widget.Note != null) {
          if (widget.Note!.note != noteController.text ||
              widget.Note!.title != titleController.text) {
            ref.read(DataBaseProvider.notifier).update(
                  DataModel(
                      id: widget.Note!.id,
                      date: DateTime.now(),
                      title: titleController.text,
                      note: noteController.text),
                );
          }
        }
        _isSaved = true;
        return;
      }
    }

    @override
    void dispose() {
      super.dispose();
      noteController.dispose();
      titleController.dispose();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(
            widget.Note != null ? "Notes" : "Add Item",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                if (widget.Note == null) {
                  if (noteController.text.isNotEmpty &&
                      titleController.text.isNotEmpty) {
                    save();
                    Navigator.pop(context);
                    return;
                  }
                  Navigator.pop(context);
                }

                if (widget.Note != null) {
                  if (noteController.text.isEmpty ||
                      titleController.text.isEmpty) {
                    _dialoge();
                    return;
                  }
                  Navigator.pop(context);
                  save();
                  return;
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: titleController,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Notes Title',
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  controller: noteController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Note",
                  ),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                ),
              ],
            )),
        floatingActionButton: ElevatedButton.icon(
            style: ButtonStyle(

                // foregroundColor: MaterialStatePropertyAll(),
                backgroundColor: widget.color == null
                    ? null
                    : MaterialStatePropertyAll(widget.color!.withOpacity(.50)),
                foregroundColor: widget.color == null
                    ? null
                    : MaterialStatePropertyAll(widget.color!.withOpacity(.99))),
            icon: const Icon(Icons.save),
            onPressed: () {
              save();
              if (_isSaved) {
                Navigator.pop(context);
              }
            },
            label: const Text('Save')));
  }
}
