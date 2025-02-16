import 'package:flutter/material.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
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
class slecated_Home_category_viwe extends StatelessWidget {
final catgory_widget catgory;
   slecated_Home_category_viwe({super.key, required this.catgory});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

