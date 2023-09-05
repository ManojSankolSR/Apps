import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/widgets/customcontainer.dart';
import 'package:ostello/Models/data.dart';
import 'package:ostello/Models/datamodel.dart';
import 'package:ostello/Providers/dataprovider.dart';
import 'package:ostello/widgets/filtersRow.dart';
import 'package:ostello/main.dart';
import 'package:ostello/widgets/searchWidget.dart';

// MAIN HOMESCREEN THAT  YOU SEE WHEN YOU OPEN APP IT INCLUDES ALL THE OTHER WIDGETS

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(dataprovider.notifier).getdata();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(dataprovider);
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 13, right: 13),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "For JEE-Mains",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                searchWidget(),
                const SizedBox(
                  height: 15,
                ),
                filtersRow(),
                const SizedBox(
                  height: 15,
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Expanded(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: kColor.withOpacity(.08),
                          ),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          height: index % 2 != 0
                              ? MediaQuery.of(context).size.height * .22
                              : MediaQuery.of(context).size.height * .26,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(18),
                                elevation: 2,
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  height:
                                      MediaQuery.of(context).size.height * .22,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: kColor.withOpacity(.09),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            alignment: Alignment.center,
                                            height: 190,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .42,
                                            foregroundDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      kColor,
                                                      Colors.transparent
                                                    ],
                                                    stops: [
                                                      0,
                                                      .8
                                                    ],
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter)),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.2),
                                                            BlendMode.overlay),
                                                    fit: BoxFit.fill,
                                                    image: const AssetImage(
                                                        'lib/assets/images/dummy.jpg'))),
                                          ),
                                          const Positioned(
                                            bottom: 10,
                                            left: 18,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                Text(
                                                  " Kalkaji , New Delhi",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      letterSpacing: 1),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list[index].coachinCenterName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19),
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 40, 140, 44),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                ),
                                                Text(
                                                  " ${list[index].rating}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  "• ",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                    "${list[index].distance} kms away",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300)),
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                customcontainer(
                                                    text: list[index]
                                                        .subjects[0]),
                                                const SizedBox(
                                                  width: 19,
                                                ),
                                                customcontainer(
                                                    text:
                                                        list[index].subjects[1])
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                customcontainer(
                                                    text: list[index]
                                                        .subjects[2]),
                                                const SizedBox(
                                                  width: 11,
                                                ),
                                                customcontainer(
                                                    text:
                                                        list[index].subjects[3])
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              width: 65,
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                color: kColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                "${list[index].off}% OFF",
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (index % 2 == 0)
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, top: 3.5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "• ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "2 of your college students study here",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
