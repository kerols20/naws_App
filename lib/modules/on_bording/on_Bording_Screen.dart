import 'package:flutter/material.dart';
import 'package:naws_app/core/api/Network/Api_network.dart';
import 'package:naws_app/core/extensions/extensions.dart';
import 'package:naws_app/core/models/catagory_widget.dart';
import 'package:naws_app/core/models/my_Drawer.dart';
import 'package:naws_app/modules/home_viwe/Home_viwe_Model.dart';
import 'package:naws_app/modules/on_bording/widget_on_Bording/widget.dart';
import 'package:provider/provider.dart';

class on_Bording extends StatefulWidget {
   on_Bording({super.key, });

  @override
  State<on_Bording> createState() => _on_BordingState();
}

class _on_BordingState extends State<on_Bording> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Home_viwe>(context);
    var theme = Theme.of(context);
    return Scaffold(
      drawer: my_Drawer(),
      appBar: AppBar(
        title: Text( provider.salecteditem == null? "Categories": provider.salecteditem!.catgoryname),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: provider.salecteditem == null? categroy_Home_Viwe(
        onTap: provider.oncategreycliced,
      ): slecated_Home_category_viwe(
        catgory: provider.salecteditem!,
      ),
    );
  }
}