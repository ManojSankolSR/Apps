import 'package:animations/animations.dart';
import 'package:bottom/Screens/NotesScreen.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:bottom/Screens/NewNoteScreen.dart';
import 'package:bottom/Screens/searchScreen.dart';
import 'package:bottom/widgets/showListView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:measured_size/measured_size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io' show Platform;

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void initState() {
    super.initState();
    ref.read(DataBaseProvider.notifier).getData();
  }

  Size size = Size(10, 10);
  double he = 10.2;

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(DataBaseProvider);
    // TODO: implement build
    return Scaffold(
      floatingActionButton: OpenContainer(
        closedElevation: 5,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        transitionType: ContainerTransitionType.fade,
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.add),
        ),
        openBuilder: (context, action) => NewNote(),
        tappable: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * .080,
            surfaceTintColor: Colors.transparent,
            pinned: true,
            title: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: search(),
                            type: PageTransitionType.scale,
                            alignment: Alignment.topRight));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: MediaQuery.of(context).size.height * .055,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(13)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/Assets/images/IOS_search.svg',
                          height: 25,
                          width: 25,
                          color: Colors.grey[600],
                        ),
                        // IconButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           PageTransition(
                        //               child: search(),
                        //               type: PageTransitionType.scale,
                        //               alignment: Alignment.topRight));
                        //     },
                        //     icon: ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Search Note",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: const Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Icon(Icons.logout),
                    )),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Spacer(),
                InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    print(Platform.operatingSystemVersion);
                    Navigator.push(
                        context,
                        PageTransition(
                            child: NoteScreen(Notes: notes),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      width: MediaQuery.of(context).size.width * .45,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 251, 172, 100),
                          // color: Colors.grey[350],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: LottieBuilder.asset(
                                      fit: BoxFit.cover,
                                      "lib/Assets/images/notetaking.json"),
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "All Notes ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GradientText(
                                  "(${notes.length})",
                                  colors: [
                                    const Color.fromARGB(255, 239, 104, 80),
                                    Color.fromARGB(255, 127, 7, 135),
                                  ],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    width: MediaQuery.of(context).size.width * .45,
                    height: MediaQuery.of(context).size.height * .3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(48, 152, 238, 204),

                        // color: Colors.grey[350],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(69, 255, 202, 100),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: LottieBuilder.asset(
                                      "lib/Assets/images/working.json"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Remainders ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GradientText(
                                "(${notes.length})",
                                colors: [
                                  const Color.fromARGB(255, 239, 104, 80),
                                  Color.fromARGB(255, 127, 7, 135),
                                ],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          const SliverAppBar(
            // backgroundColor: Colors.amber,
            expandedHeight: 0,
            toolbarHeight: 10,

            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Recent",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: notes.length < 5 ? notes.length : 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 7, left: 10, right: 10),
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
                        color: Colors.primaries[index % Colors.primaries.length]
                            .shade100,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EEEE').format(notes[index].date),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.primaries[
                                        index % Colors.primaries.length],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: .5,
                                  color: Colors.primaries[
                                      index % Colors.primaries.length],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 5),
                                  child: Row(
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
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          notes[index].note,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: Row(
                              children: [
                                Text(
                                  formatterForDate.format(notes[index].date),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  formatterForTime.format(notes[index].date),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 1,
                          //   color: Colors
                          //       .primaries[index % Colors.primaries.length],
                          // )
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
          )),
        ],
      ),
    );
  }
}
