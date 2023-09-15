import 'package:api/screens/NewsInfoScreen.dart';
import 'package:api/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BreakingNews extends StatelessWidget {
  final List<datamodel> news;
  BreakingNews({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              height: kIsWeb ? 400 : 250,
            ),
            items: news.map((N) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: NewsInfoScreen(News: N),
                          type: PageTransitionType.rightToLeft));
                },
                child: Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: N.urlToImage,
                              placeholder: (context, url) {
                                return Center(
                                    child: LottieBuilder.asset(
                                        fit: BoxFit.fill,
                                        frameRate: FrameRate.max,
                                        "lib/Assets/pngicons/latestloading.json"));
                              },
                              errorWidget: (context, url, error) {
                                return Center(
                                    child: LottieBuilder.asset(
                                        frameRate: FrameRate.max,
                                        "lib/Assets/pngicons/imageplaceholder.json"));
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black12.withOpacity(0),
                                        Colors.black
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${N.title}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              );
            }).toList(),

            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: news.length,
            //   itemBuilder: (context, index) {
            //     return InkWell(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             PageTransition(
            //                 child: NewsInfoScreen(News: news[index]),
            //                 type: PageTransitionType.rightToLeft));
            //       },
            //       child: Container(
            //         height: MediaQuery.of(context).size.height * .35,
            //         clipBehavior: Clip.hardEdge,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30),
            //           color: Colors.white,
            //         ),
            //         margin: EdgeInsets.symmetric(horizontal: 10),
            //         width: MediaQuery.of(context).size.width * .8,
            //         child: Column(
            //           children: [
            //             CachedNetworkImage(
            //               imageUrl: "${news[index].urlToImage}",
            //               imageBuilder: (context, imageProvider) => Container(
            //                 height: MediaQuery.of(context).size.height * .25,
            //                 width: 500,
            //                 decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                         image: imageProvider, fit: BoxFit.fill)),
            //               ),
            //               placeholder: (context, url) => Container(
            //                 height: MediaQuery.of(context).size.height * .25,
            //                 width: 500,
            //                 child: Center(
            //                     child: LottieBuilder.asset(
            //                         height: 500,
            //                         width: 500,
            //                         fit: BoxFit.fill,
            //                         frameRate: FrameRate.max,
            //                         "lib/Assets/pngicons/latestloading.json")),
            //               ),
            //               errorWidget: (context, url, error) => Container(
            //                 height: MediaQuery.of(context).size.height * .25,
            //                 width: 500,
            //                 child: Center(
            //                     child: LottieBuilder.asset(
            //                         frameRate: FrameRate.max,
            //                         "lib/Assets/pngicons/latestloading.json")),
            //               ),
            //             ),
            //             Container(
            //               padding: EdgeInsets.all(10),
            //               child: Text(
            //                 "${news[index].title.characters.take(100).toString()}",
            //                 style: TextStyle(
            //                     fontSize: 15, fontWeight: FontWeight.w700),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
