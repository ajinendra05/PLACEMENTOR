class InternDetails {
  final String category;
  final String company;
  final DateTime todayDaaate;
  final double package;
  bool isfavorite = false;
  final String cloudID;
  final String firm;
  final String jobD;
  final String skill;
  final String img;

  InternDetails({
    required this.firm,
    required this.jobD,
    required this.skill,
    required this.img,
    required this.category,
    required this.company,
    required this.todayDaaate,
    required this.package,
    required this.isfavorite,
    required this.cloudID,
  });
  InternDetails.fromMap(Map snapshot, String id)
      : firm = snapshot['firm'] ?? '',
        jobD = snapshot['jobD'] ?? '',
        skill = snapshot['skill'] ?? '',
        img = snapshot['img'] ?? '',
        category = snapshot['cat'] ?? '',
        company = snapshot['com'] ?? '',
        todayDaaate = DateTime.fromMillisecondsSinceEpoch(
            snapshot['date'].microsecondsSinceEpoch),
        package = snapshot['pkg'] ?? '',
        isfavorite = snapshot['fav'] ?? '',
        cloudID = id;

  // factory InternDetails.fromFirestore(DocumentSnapshot doc) {
  //   Object? data = doc.data;

  //   return InternDetails(
  //       firm: data?['firm'],
  //       jobD: data['jobD'],
  //       skill: data['skill'],
  //       img: data['img'],
  //       category: data['cat'],
  //       company: data['com'],
  //       todayDaaate: DateTime.fromMillisecondsSinceEpoch(
  //           data['date'].microsecondsSinceEpoch),
  //       package: data['pkg'],
  //       isfavorite: data['fav'],
  //       cloudID: data.id);
  // }
}
