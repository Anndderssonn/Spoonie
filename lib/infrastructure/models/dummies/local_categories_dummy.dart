class CategoryDummy {
  final List<CategoryDatum> data;

  CategoryDummy({required this.data});

  factory CategoryDummy.fromJson(Map<String, dynamic> json) => CategoryDummy(
    data: List<CategoryDatum>.from(
      json["data"].map((x) => CategoryDatum.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryDatum {
  final String id;
  final String title;
  final String color;

  CategoryDatum({required this.id, required this.title, required this.color});

  factory CategoryDatum.fromJson(Map<String, dynamic> json) =>
      CategoryDatum(id: json["id"], title: json["title"], color: json["color"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "color": color};
}
