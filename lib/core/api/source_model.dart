class sourcesModel{
  /// in postman when you see {} create class
  final String status;
  /// first item find after {} add to class
  final List<Source> sources;
  /// List find in {} so create class to gat for he items i needed to add to class

  sourcesModel({required this.status, required this.sources});
  /// factory is special type of constructor
  factory sourcesModel.fromJson(Map<String, dynamic> json) {
    return sourcesModel(
      status: json['status'], /// e is abject e =
      ///    {
      //             "id": "google-news-sa",
      //             "name": "Google News (Saudi Arabia)",
      //             "description": "تغطية شاملة ومتجددة للأخبار، تم جمعها من مصادر أخبار من جميع أنحاء العالم بواسطة أخبار Google.",
      //             "url": "https://news.google.com",
      //             "category": "general",
      //             "language": "ar",
      //             "country": "sa"
      //         }, /// after that pass to Source. fromjson to gat the item i needed
      sources: (json['sources'] as List).map((e) => Source.fromJson(e)).toList() ,
    );
  }
}
class Source {
  final String id;
  final String name;
  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
