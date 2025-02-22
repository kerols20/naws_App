import 'package:flutter/material.dart';
import 'package:naws_app/core/api/Network/Api_network.dart';
import 'package:naws_app/core/api/article_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String id = "search_screen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> articles = [];
  int currentPage = 1;
  bool isLoading = false;
  String error = "";
  TextEditingController searchController = TextEditingController();

  void searchArticles(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      error = "";
    });

    try {
      List<Article> searchResults = await Api_network.getAllSearch(query, currentPage);
      setState(() {
        articles = searchResults;
      });
    } catch (e) {
      setState(() {
        error = "Error fetching articles: ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SizedBox(),
            leadingWidth: 0,
            floating: true,
            toolbarHeight: 80,
            backgroundColor: Colors.black,
            centerTitle: true,
            title: TextFormField(
              controller: searchController,
              style: TextStyle(color: Colors.white),
              onFieldSubmitted: searchArticles,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                suffixIcon: InkWell(
                  onTap: () {
                    searchController.clear();
                    setState(() {
                      articles.clear();
                      error = "";
                    });
                  },
                  child: InkWell(
                    onTap: Navigator.of(context).pop,
                      child: Icon(Icons.close, color: Colors.white)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),

          if (isLoading)
            SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator(color: Colors.white)),
            ),

          if (error.isNotEmpty)
            SliverToBoxAdapter(
              child: Center(child: Text(error, style: TextStyle(color: Colors.red, fontSize: 16))),
            ),

          if (articles.isEmpty && !isLoading)
            SliverToBoxAdapter(
              child: Center(child: Icon(Icons.error, color: Colors.white, size: 50)),
            ),

          if (articles.isNotEmpty)
            SliverList.separated(
              itemCount: articles.length,
              separatorBuilder: (context, index) => Divider(color: Colors.white),
              itemBuilder: (context, index) {
                final article = articles[index];

                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      article.urlToImage.isNotEmpty ? article.urlToImage : "https://via.placeholder.com/150",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/placeholder.jpg",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image, color: Colors.white, size: 80);
                          },
                        );
                      },
                    ),
                  ),
                  title: Text(
                    article.title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        "By: ${article.author.isNotEmpty ? article.author : 'Unknown Author'}",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3),
                      Text(
                        article.timeAgo,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),

        ],
      ),
    );
  }
}
