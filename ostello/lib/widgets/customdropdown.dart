import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/Models/data.dart';
import 'package:ostello/Providers/dataprovider.dart';

import 'package:ostello/main.dart';

// DROPDOWN BUTTON WITH IT'S ITEMS FOR SORTING DATA I UI ACCORDING TO SOME SPECIFIC CONDITIONS

class customdropdown extends ConsumerStatefulWidget {
  customdropdown({super.key});

  @override
  ConsumerState<customdropdown> createState() => _customdropdownState();
}

class _customdropdownState extends ConsumerState<customdropdown> {
  late GlobalKey dropdownKey;

  // int? _selindex;
  int _Groupval = -1;
  // TODO: implement build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownKey = GlobalKey();
  }

  void _sort(int val) async {
    ref.read(dataprovider.notifier).sortdata(val);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          customButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kColor,
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sort",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 19,
                      color: kColor,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  width: 10,
                ),
                Transform.rotate(
                  angle: 180 * pi / 120,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: kColor,
                    size: 19,
                  ),
                )
              ],
            ),
          ),
          iconStyleData: const IconStyleData(
              icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: kColor,
          )),
          onChanged: (value) async {
            setState(() {
              _Groupval = value as int;
            });
            _sort(value as int);
          },
          key: dropdownKey,
          dropdownStyleData: DropdownStyleData(
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kColor,
                    width: 2,
                  ))),
          items: sortDropdowndata
              .map(
                (e) => DropdownMenuItem(
                  value: e[0],
                  child: Row(
                    children: [
                      Radio(
                        activeColor: kColor,
                        value: e[0],
                        groupValue: _Groupval,
                        onChanged: (value) {
                          setState(() {
                            _Groupval = value!;
                          });
                          Navigator.pop(dropdownKey.currentContext!);
                        },
                      ),
                      Text(
                        e[1].toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
