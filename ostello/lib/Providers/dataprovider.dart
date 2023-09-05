import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/Models/data.dart';
import 'package:ostello/Models/datamodel.dart';

// RIVERPOD STATENOTIFIER

class datanotifier extends StateNotifier<List<datamodel>> {
  datanotifier() : super(const []);

// USED TO LOAD DATA
  void getdata() async {
    state = centersList;
  }

  //USED TO SEARCH COACHING CENTER BY ENTERING IT'S NAME
  void search(String s) {
    state = centersList
        .where((element) =>
            element.coachinCenterName.toLowerCase().contains(s.toLowerCase()))
        .toList();
  }

  // USED TO SORT THE DATA BASED ON SOME CONDITION LIKE DISTANCE RATING ETC....
  void sortdata(int val) {
    print("Entered sortdata");
    print(val);
    if (val == 1) {
      print(val);
      state = (centersList
            ..sort(
              (a, b) => a.distance.compareTo(b.distance),
            ))
          .toList();
    }
    if (val == 2) {
      print(val);
      state = (centersList
            ..sort(
              (a, b) => a.off.compareTo(b.off),
            ))
          .reversed
          .toList();
      for (var i in state) {
        print(i.off);
      }
    }
    if (val == 3) {
      print(val);
      state = (centersList
            ..sort(
              (a, b) => a.rating.compareTo(b.rating),
            ))
          .reversed
          .toList();
    }
  }

// USED FILTER DATA BASED ON SOME CONDITIONS
  void selected(int val) async {
    if (val == 2) {
      state = centersList
          .where((element) => element.distance <= 2)
          .toList()
          .reversed
          .toList();
    }
    if (val == 3) {
      print(val);
      state = centersList
          .where((element) => element.subjects.contains("JEE"))
          .toList();
    }
    if (val == 4) {
      print(val);
      state = centersList
          .where((element) => element.subjects.contains("NEET"))
          .toList();
    }
  }
}

// PROVIDER FOR DATANOTIFIER CLASS

final dataprovider = StateNotifierProvider<datanotifier, List<datamodel>>(
    (ref) => datanotifier());
