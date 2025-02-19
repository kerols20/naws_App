import 'package:timeago/timeago.dart' as timeago;

class ArticleModel {
  final String status;
  final List<Article> articles;

  ArticleModel({required this.status, required this.articles});

  factory ArticleModel.fromHason(Map<String , dynamic> jason) =>
      ArticleModel(
          status: jason["status"],
          articles: (jason["articles"] as List)
              .map((e) => Article.fromJson(e))
              .toList()
      );
}

class Article {
  final String id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  /// 🔹 دالة لحساب الزمن بصيغة "1m", "1h", "1d", "1w", "1mo"
  String get timeAgo {
    DateTime time;
    try {
      time = DateTime.parse(publishedAt);
    } catch (e) {
      return "Unknown Time";
    }
    return timeago.format(time, locale: 'short');
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']?['id'] ?? "unknown_id",
      name: json['source']?['name'] ?? "unknown_name",
      author: json['author'] ?? "Unknown Author",
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      url: json['url'] ?? "#",
      urlToImage: json['urlToImage'] ?? "https://via.placeholder.com/150",
      publishedAt: json['publishedAt'] ?? "Unknown Date",
      content: json['content'] ?? "No Content",
    );
  }
}

// 🔹 تسجيل التهيئة عند تشغيل التطبيق
void initTimeAgo() {
  timeago.setLocaleMessages('short', ShortTimeMessages());
}

class ShortTimeMessages implements timeago.LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => '1m';
  @override String aboutAMinute(int minutes) => '1m';
  @override String minutes(int minutes) => '${minutes}m';
  @override String aboutAnHour(int minutes) => '1h';
  @override String hours(int hours) => '${hours}h';
  @override String aDay(int hours) => '1d';
  @override String days(int days) => '${days}d';
  @override String aboutAMonth(int days) => '1mo';
  @override String months(int months) => '${months}mo';
  @override String aboutAYear(int year) => '1y';
  @override String years(int years) => '${years}y';
  @override String wordSeparator() => ' ';
}
