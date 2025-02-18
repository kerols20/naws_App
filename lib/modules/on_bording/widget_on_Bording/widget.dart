import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:naws_app/core/extensions/extensions.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
import 'package:naws_app/modules/home_viwe/Home_viwe_Model.dart';
import 'package:provider/provider.dart';
class categroy_Home_Viwe extends StatelessWidget {
  final void Function(catgory_widget) onTap;
   categroy_Home_Viwe({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    catgory_widget? _salecteditem; // null
    List<catgory_widget> catgoryList = [
      catgory_widget(catgoryId: "General", catgoryname: "General", catgoryIamge: "assets/images/Frame 10.png"),
      catgory_widget(catgoryId: "Business", catgoryname: "Business", catgoryIamge: "assets/images/Frame 11.png"),
      catgory_widget(catgoryId: "Sports", catgoryname: "Sports", catgoryIamge: "assets/images/Frame 12.png"),
      catgory_widget(catgoryId: "Health", catgoryname: "Health", catgoryIamge: "assets/images/Frame 12 (1).png"),
    ];
    var theme = Theme.of(context);
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0), // إضافة تباعد خارجي
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning\n Here some news for you",
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                alignment: index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
                children: [
                  Image.asset(catgoryList[index].catgoryIamge),
                  Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Directionality(
                      textDirection: index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
                      child: Row(
                        children: [
                           GestureDetector(
                             onTap: (){
                               onTap(catgoryList[index]);
                             },
                             child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "View All",
                                  style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                                ),
                              ),
                           ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: catgoryList.length,
            ),
          ],
        ),
      ),
    );
  }
}
class slecated_Home_category_viwe extends StatefulWidget {
final catgory_widget catgory;
   slecated_Home_category_viwe({super.key, required this.catgory});

  @override
  State<slecated_Home_category_viwe> createState() => _slecated_Home_category_viweState();
}

class _slecated_Home_category_viweState extends State<slecated_Home_category_viwe> {
  @override
  late Home_viwe catgory;
  @override
  void initState() {
    catgory =  Provider.of<Home_viwe>(context, listen: false);
    Future.wait([
      catgory.gatAllSources(),
    ]).then(
          (value) {
            catgory.gatAllArticals();
          },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: catgory.sourcesList.length,
          child: TabBar(
            onTap: catgory.satSelctedsourse,
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabs: catgory.sourcesList.map((e) => Text(e.name)).toList(),
          ),
        ),
        Expanded(
          child: ListView.separated(itemBuilder: (context, index) => Container(
            width: 360,
            height: 320,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: CachedNetworkImage(
              imageUrl: catgory.articlesList[index].urlToImage,
              imageBuilder: (context, imageProvider) =>
    Column(
    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النصوص لليسار
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
    height: 200, // تحديد ارتفاع مناسب للصورة
    width: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: imageProvider,
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    ),
    ),
    ),
    ),
    SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Text(
    catgory.articlesList[index].title,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    maxLines: 2, // تجنب أن يتجاوز العنوان أكثر من سطرين
    overflow: TextOverflow.ellipsis, // إضافة نقاط إذا كان النص طويلًا
    ),
    ),
    SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Expanded(
    child: Text(
    catgory.articlesList[index].author,
    style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey[700], // لون أفتح قليلاً ليكون أكثر أناقة
    ),
    maxLines: 1, // تجنب تجاوز الاسم لسطرين
    overflow: TextOverflow.ellipsis,
    ),
    ),
    Text(
    catgory.articlesList[index].publishedAt,
    style: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
    ),
    ),
    ],
    ),
    ),
    ],
    ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
              separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: catgory.articlesList.length).withPadding(5),
        )
      ],
    );
  }
}

