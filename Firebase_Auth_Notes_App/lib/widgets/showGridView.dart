import 'package:bottom/Models/DataModel.dart';
import 'package:bottom/Screens/NewNoteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:bottom/Screens/NotesScreen.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class showGridView extends ConsumerWidget {
  showGridView({
    super.key,
  });
  void snack(BuildContext context) {}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DataModel> Notes = ref.watch(DataBaseProvider);
    return Notes.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
        : StaggeredGridView.countBuilder(
            itemCount: Notes.length,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(Notes[index].id),
                onDismissed: (direction) async {
                  final delnote = await ref
                      .read(DataBaseProvider.notifier)
                      .delete(Notes[index]);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Row(
                          children: [
                            const Text("Note Deleted"),
                            TextButton(
                                onPressed: () async {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                  }
                                  ref
                                      .read(DataBaseProvider.notifier)
                                      .addNote(delnote);
                                },
                                child: const Text('Undo...'))
                          ],
                        )));
                  }
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: NewNote(
                              Note: Notes[index],
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                            ),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    Notes[index].title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(child: Text(Notes[index].note)),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    formatterForTime.format(Notes[index].date)),
                                const Spacer(),
                                Text(
                                    formatterForDate.format(Notes[index].date)),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                //OpenContainer(
                //   closedBuilder: (context, action) => InkWell(
                //     onTap: action,
                //     child: Container(
                //       color: _Gridcolor,
                //       child: Padding(
                //         padding: const EdgeInsets.all(15),
                //         child: Text(Notes[index].note),
                //       ),
                //     ),
                //   ),
                //   openBuilder: (context, action) =>
                //       NewItem(value: 'sdbhsbsbjdfbajkbfjabjsfj'),
                // );

                // openBuilder: (context, action) {
                //   return NewItem(
                //     Note: Notes[index],
                //     color: Colors.primaries[index % Colors.primaries.length],
                //   );
                // },
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
  }
}
