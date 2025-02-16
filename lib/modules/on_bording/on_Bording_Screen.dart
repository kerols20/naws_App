import 'package:flutter/material.dart';
import 'package:naws_app/core/extensions/extensions.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
import 'package:naws_app/modules/on_bording/widget_on_Bording/widget.dart';

class on_Bording extends StatefulWidget {
   on_Bording({super.key, });

  @override
  State<on_Bording> createState() => _on_BordingState();
}

class _on_BordingState extends State<on_Bording> {

  catgory_widget? _salecteditem; // null
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
        title: Text(_salecteditem == null? "Categories": _salecteditem!.catgoryname),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _salecteditem == null? categroy_Home_Viwe(
        onTap: oncategreycliced,
      ): slecated_Home_category_viwe(
        catgory: _salecteditem!,
      ),
    );
  }
  void oncategreycliced(catgory_widget catgory){
    setState(() {
      _salecteditem = catgory;
    });
    print(catgory.catgoryId);
  }
}