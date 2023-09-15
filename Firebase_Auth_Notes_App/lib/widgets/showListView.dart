import 'package:bottom/Models/DataModel.dart';
import 'package:bottom/Screens/NewNoteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom/Screens/NotesScreen.dart';
import 'package:animations/animations.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class showListView extends ConsumerWidget {
  showListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DataModel> notes = ref.watch(DataBaseProvider);
    // TODO: implement build
    return notes.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset('lib/Assets/images/animation_lltd0cpg.json',
                  frameRate: FrameRate.max),
              GradientText(
                gradientDirection: GradientDirection.ltr,
                gradientType: GradientType.linear,
                "Hi There Try adding Some Notes",
                colors: [
                  const Color.fromARGB(255, 239, 104, 80),
                  Color.fromARGB(255, 127, 7, 135),
                ],
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        : ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Dismissible(
                  key: Key(notes[index].id),
                  onDismissed: (direction) async {
                    final DelNote = await ref
                        .read(DataBaseProvider.notifier)
                        .delete(notes[index]);
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 2),
                        content: Row(
                          children: [
                            const Text("Note Deleted"),
                            const Spacer(),
                            TextButton(
                                onPressed: () async {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                  }
                                  ref
                                      .read(DataBaseProvider.notifier)
                                      .addNote(DelNote);
                                },
                                child: const Text('Undo...'))
                          ],
                        )));
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: NewNote(
                              Note: notes[index],
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                            ),
                            type: PageTransitionType.rightToLeft,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                      ),
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
                                        notes[index].title,
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
                                        notes[index].note,
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
                                  formatterForDate.format(notes[index].date),
                                ),
                                const Spacer(),
                                Text(
                                  formatterForTime.format(notes[index].date),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // openBuilder: (context, action) {
                  //   return NewItem(
                  //     Note: notes[index],
                  //     color: Colors.primaries[index % Colors.primaries.length],
                  //   );
                  // },
                ),
              );
            },
          );
  }
}
