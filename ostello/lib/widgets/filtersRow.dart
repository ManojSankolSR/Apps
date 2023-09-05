import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/widgets/customdropdown.dart';
import 'package:ostello/Models/data.dart';
import 'package:ostello/Providers/dataprovider.dart';
import 'package:ostello/main.dart';

// ROW THAT REPRESENTS SOME BUTTONS BELOW THE SEARCH BAR INCLUDING SORT DROPDOWN BUTTON WITH SOME OTHER BUTTONS

class filtersRow extends ConsumerStatefulWidget {
  filtersRow({super.key});

  @override
  ConsumerState<filtersRow> createState() => _filtersRowState();
}

class _filtersRowState extends ConsumerState<filtersRow> {
  Color textcolor = kColor;
  Color backcolor = Colors.white;
  int? _selindex;
  @override
  Widget build(BuildContext context) {
    Widget w = InkWell(
      onTap: () async {
        // ref.read(dataprovider.notifier).sortdata();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kColor, width: 1)),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Filter",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 19,
                  color: kColor,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.format_list_bulleted_sharp,
              color: kColor,
              size: 19,
            )
          ],
        ),
      ),
    );
    _onselect(int index) {
      ref.read(dataprovider.notifier).selected(index);
      setState(() {
        _selindex = index;
      });
    }

    // TODO: implement build
    return Container(
      height: 41,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: rowoptions.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? w
                    : index == 1
                        ? customdropdown()
                        : InkWell(
                            onTap: () {
                              _onselect(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.center,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: _selindex == index && _selindex != null
                                      ? kColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: kColor, width: 1)),
                              child: Text(
                                rowoptions[index],
                                style: TextStyle(
                                    fontSize: 19,
                                    color:
                                        _selindex == index && _selindex != null
                                            ? Colors.white
                                            : kColor,
                                    fontWeight: FontWeight.w300),
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
