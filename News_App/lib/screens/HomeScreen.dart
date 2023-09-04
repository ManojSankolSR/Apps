import 'package:api/widgets/tabview.dart';
import 'package:api/widgets/BreakingNews.dart';
import 'package:api/screens/Search.dart';
import 'package:api/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  final List<List<datamodel>> news;
  HomeScreen({super.key, required this.news});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int TabNo = 1;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color.fromRGBO(216, 180, 248, 100)),
                    child: Image.asset(
                      'lib/Assets/pngicons/menu.png',
                      color: Color.fromRGBO(175, 83, 255, 0.612),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Search(),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color.fromRGBO(216, 180, 248, 100)),
                    child: SvgPicture.asset(
                      'lib/Assets/pngicons/IOS_search.svg',
                      color: Color.fromRGBO(165, 69, 249, 0.612),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Text(
              "Breaking News",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BreakingNews(news: widget.news[0]),
          Container(
            height: MediaQuery.of(context).size.height * .055,
            child: DefaultTabController(
                length: 7,
                child: TabBar(
                    controller: _tabController,
                    onTap: (value) {
                      setState(() {
                        TabNo = value;
                      });
                    },
                    indicatorWeight: 3,
                    overlayColor: MaterialStatePropertyAll(
                        Color.fromRGBO(216, 180, 248, 100)),
                    indicatorColor: Color.fromRGBO(175, 83, 255, 0.612),
                    isScrollable: true,
                    labelColor: Color.fromRGBO(175, 83, 255, 0.612),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Text(
                        "Technology",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text("Entertainment",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text("General",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text("Science",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text("Sports",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text("Business",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text("Health",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ])),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .88,
            child: TabBarView(controller: _tabController, children: [
              tabView(news: widget.news[7]),
              tabView(news: widget.news[2]),
              tabView(news: widget.news[3]),
              tabView(news: widget.news[5]),
              tabView(news: widget.news[6]),
              tabView(news: widget.news[1]),
              tabView(news: widget.news[4]),
            ]),
          )
        ]),
      ),
    );
    // child: Padding(
    //   // padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    //   padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    //         child: Row(
    //           children: [
    //             Container(
    //               padding: EdgeInsets.all(6),
    //               height: 55,
    //               width: 55,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(13),
    //                   color: Color.fromRGBO(216, 180, 248, 100)),
    //               child: Image.asset(
    //                 'lib/Assets/pngicons/menu.png',
    //                 color: Color.fromRGBO(175, 83, 255, 0.612),
    //               ),
    //             ),
    //             Spacer(),
    //             InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     PageTransition(
    //                         child: Search(),
    //                         type: PageTransitionType.rightToLeft));
    //               },
    //               child: Container(
    //                 padding: EdgeInsets.all(10),
    //                 height: 55,
    //                 width: 55,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(13),
    //                     color: Color.fromRGBO(216, 180, 248, 100)),
    //                 child: SvgPicture.asset(
    //                   'lib/Assets/pngicons/IOS_search.svg',
    //                   color: Color.fromRGBO(165, 69, 249, 0.612),
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
    //         child: Text(
    //           "Breaking News",
    //           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       BreakingNews(news: widget.news[0]),
    //       SizedBox(
    //         height: 15,
    //       ),
    //       Container(
    //         height: MediaQuery.of(context).size.height * .055,
    //         child: DefaultTabController(
    //             length: 7,
    //             child: TabBar(
    //                 controller: _tabController,
    //                 onTap: (value) {
    //                   setState(() {
    //                     TabNo = value;
    //                   });
    //                 },
    //                 indicatorWeight: 3,
    //                 overlayColor: MaterialStatePropertyAll(
    //                     Color.fromRGBO(216, 180, 248, 100)),
    //                 indicatorColor: Color.fromRGBO(175, 83, 255, 0.612),
    //                 isScrollable: true,
    //                 labelColor: Color.fromRGBO(175, 83, 255, 0.612),
    //                 unselectedLabelColor: Colors.black,
    //                 tabs: [
    //                   Text(
    //                     "Technology",
    //                     style: TextStyle(
    //                         fontSize: 17, fontWeight: FontWeight.bold),
    //                   ),
    //                   Text("Entertainment",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                   Text("General",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                   Text("Science",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                   Text("Sports",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                   Text("Business",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                   Text("Health",
    //                       style: TextStyle(
    //                           fontSize: 17, fontWeight: FontWeight.bold)),
    //                 ])),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Expanded(
    //         child: TabBarView(controller: _tabController, children: [
    //           Technology(news: widget.news[7]),
    //           Technology(news: widget.news[2]),
    //           Technology(news: widget.news[3]),
    //           Technology(news: widget.news[5]),
    //           Technology(news: widget.news[6]),
    //           Technology(news: widget.news[1]),
    //           Technology(news: widget.news[4]),
    //         ]),
    //       )
    //     ],
    //   ),
    // ),
  }
}
