import 'package:ostello/Models/datamodel.dart';

// DUMMY DATA USED

final List<datamodel> centersList = [
  datamodel(
    coachinCenterName: "Metro coaching Center",
    distance: 3,
    off: 25,
    rating: 4.3,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
  datamodel(
    coachinCenterName: "Logan coaching Center",
    distance: 2,
    off: 30,
    rating: 3.3,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
  datamodel(
    coachinCenterName: "RSV coaching Center",
    distance: 4,
    off: 35,
    rating: 2.3,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "JEE"],
  ),
  datamodel(
    coachinCenterName: "Locco coaching Center",
    distance: 5,
    off: 15,
    rating: 1.0,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "JEE"],
  ),
  datamodel(
    coachinCenterName: "VSR coaching Center",
    distance: 2,
    off: 80,
    rating: 4.2,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
  datamodel(
    coachinCenterName: "SBVP coaching Center",
    distance: 3,
    off: 63,
    rating: 3.2,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "JEE"],
  ),
  datamodel(
    coachinCenterName: "NHPES coaching Center",
    distance: 7,
    off: 77,
    rating: 4.4,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
  datamodel(
    coachinCenterName: "JHON coaching Center",
    distance: 5,
    off: 88,
    rating: 4.1,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "KCET"],
  ),
  datamodel(
    coachinCenterName: "CHRIST coaching Center",
    distance: 9,
    off: 29,
    rating: 2.2,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "JEE"],
  ),
  datamodel(
    coachinCenterName: "Alliance coaching Center",
    distance: 3,
    off: 69,
    rating: 2.3,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
  datamodel(
    coachinCenterName: "RNS coaching Center",
    distance: 1,
    off: 56,
    rating: 5.0,
    subjects: ["PHYSICS", "MATHS", "CHEMISTRY", "NEET"],
  ),
];

final List<String> rowoptions = ["", "", "<2Km", "JEE", "NEET", "Courses"];

List sortDropdowndata = [
  [0, "Relevence"],
  [1, "Distance"],
  [2, "Price"],
  [3, "Rating"],
];
