// MODEL FOR THE GIVEN DATA

class datamodel {
  final String coachinCenterName;
  final int distance;
  final List subjects;
  final double rating;
  final int off;

  datamodel(
      {required this.coachinCenterName,
      required this.distance,
      required this.off,
      required this.rating,
      required this.subjects});
}
