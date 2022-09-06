class FavoutieModel {
  String name;
  String weblink;
  int? id;
  bool isfav;

  FavoutieModel(
      {required this.name, required this.weblink, this.id, this.isfav = false});

  static FavoutieModel fromJson(Map<String, Object?> map) {
    final id = map["id"] as int;
    final name = map["name"] as String;
    final weblink = map["weblink"] as String;

    return FavoutieModel(id: id, name: name, weblink: weblink);
  }
}
