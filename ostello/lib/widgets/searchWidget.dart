import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/Providers/dataprovider.dart';
import 'package:ostello/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

// SEARCH WIDGET MADE WITH TEXTFIELD AND SOME ICONS

class searchWidget extends ConsumerWidget {
  searchWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[350]!, width: 2)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  ref.read(dataprovider.notifier).search(value);
                },
                cursorColor: kColor,
                decoration: const InputDecoration(
                    hintText: "Search for Upsc Coaching",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                    border: InputBorder.none),
              ),
            ),
            SvgPicture.asset(
              'lib/assets/images/IOS_search.svg',
              height: 25,
              color: Colors.black45,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
              width: 1,
              color: Colors.grey[350]!,
            ),
            const Icon(
              Icons.mic_none_sharp,
              color: kColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
