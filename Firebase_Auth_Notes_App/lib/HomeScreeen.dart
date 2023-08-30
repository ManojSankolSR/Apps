import 'package:animations/animations.dart';
import 'package:bottom/Providers/DataBaseProvider.dart';
import 'package:bottom/Providers/EmailPassProvider.dart';
import 'package:bottom/new_item.dart';
import 'package:bottom/search.dart';
import 'package:bottom/widgets/showGridView.dart';
import 'package:bottom/widgets/showListView.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

final formatterForDate = DateFormat.yMd();
final formatterForTime = DateFormat('h:mm a');

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  ScrollController? _scrollController;
  double kExpandedHeight = 180;

  bool _isListView = true;

  @override
  void initState() {
    super.initState();
    ref.read(DataBaseProvider.notifier).getData();
  }

  @override
  Widget build(BuildContext context) {
    final Notes = ref.watch(DataBaseProvider);
    final _load = ref.watch(idustateprovider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 11, top: 5),
          child: GradientText(
            gradientDirection: GradientDirection.ttb,
            gradientType: GradientType.linear,
            "Notes",
            colors: [
              const Color.fromARGB(255, 239, 104, 80),
              Color.fromARGB(255, 127, 7, 135),
            ],
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: search(),
                        type: PageTransitionType.scale,
                        alignment: Alignment.topRight));
              },
              icon: SvgPicture.asset(
                'lib/Assets/images/IOS_search.svg',
                height: 28,
                width: 28,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  _isListView = !_isListView;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Icon(
                  _isListView
                      ? Icons.grid_view_rounded
                      : Icons.format_list_bulleted,
                  size: 34,
                ),
              )),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.logout),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: _load
              ? Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                      color: Colors.black, size: 50),
                )
              : _isListView
                  ? showListView(notes: Notes)
                  : showGridView(Notes: Notes),
        ),
      ),
      floatingActionButton: OpenContainer(
        closedElevation: 5,
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        transitionType: ContainerTransitionType.fade,
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: action,
          child: const Icon(Icons.add),
        ),
        openBuilder: (context, action) => NewItem(),
        tappable: true,
      ),
    );
  }
}
