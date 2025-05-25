class CategoryDummy {
  final List<Datum> data;

  CategoryDummy({required this.data});

  factory CategoryDummy.fromJson(Map<String, dynamic> json) => CategoryDummy(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String id;
  final String title;
  final String color;

  Datum({required this.id, required this.title, required this.color});

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(id: json["id"], title: json["title"], color: json["color"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "color": color};
}
