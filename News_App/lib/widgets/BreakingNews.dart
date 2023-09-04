import 'package:api/screens/NewsInfoScreen.dart';
import 'package:api/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BreakingNews extends StatelessWidget {
  final List<datamodel> news;
  BreakingNews({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * .36,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: NewsInfoScreen(News: news[index]),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .35,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width * .8,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${news[index].urlToImage}",
                          imageBuilder: (context, imageProvider) => Container(
                            height: MediaQuery.of(context).size.height * .25,
                            width: 500,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.fill)),
                          ),
                          placeholder: (context, url) => Container(
                            height: MediaQuery.of(context).size.height * .25,
                            width: 500,
                            child: Center(
                                child: LoadingAnimationWidget.beat(
                                    color: Color.fromRGBO(162, 56, 255, 0.612),
                                    size: 60)),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: MediaQuery.of(context).size.height * .25,
                            width: 500,
                            child: Center(
                                child: Icon(
                              Icons.error,
                              size: 60,
                            )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "${news[index].title}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
