import 'package:flutter/material.dart';
import 'package:naws_app/core/extensions/extensions.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
import 'package:naws_app/modules/on_bording/widget_on_Bording/widget.dart';

class on_Bording extends StatefulWidget {
   on_Bording({super.key});

  @override
  State<on_Bording> createState() => _on_BordingState();
}

class _on_BordingState extends State<on_Bording> {
  List<catgory_widget> catgoryList = [
    catgory_widget(catgoryId: "General", catgoryname: "General", catgoryIamge: "assets/images/Frame 10.png"),
    catgory_widget(catgoryId: "Business", catgoryname: "Business", catgoryIamge: "assets/images/Frame 11.png"),
    catgory_widget(catgoryId: "Sports", catgoryname: "Sports", catgoryIamge: "assets/images/Frame 12.png"),
    catgory_widget(catgoryId: "Health", catgoryname: "Health", catgoryIamge: "assets/images/Frame 12 (1).png"),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Good Morning\n Here is some naws for you", style: theme.textTheme.headlineMedium),
            ),
            10.spaceVertcial,
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) => Stack(
                  alignment: index%2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                  children: [
                    Image.asset(catgoryList[index].catgoryIamge,),
                    Padding(
                      padding:  EdgeInsets.only(top: 105, right: index % 2 == 0 ? 10 : 0, left: index % 2 == 0 ? 0 : 10),
                      child:  index%2 == 0 ? widgetRight() : WidgetLeft(),
                    )
                  ],
                ), separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: catgoryList.length)
          ],
        ),
      ),
    );
  }
}