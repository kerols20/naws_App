import 'package:flutter/material.dart';
import 'package:naws_app/modules/home_viwe/Home_viwe_Model.dart';
import 'package:provider/provider.dart';

class my_Drawer extends StatelessWidget {
  const my_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Home_viwe>(context);
    var Size = MediaQuery.of(context);
    var theme = Theme.of(context);
    return  Container(
      width: Size.size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: Size.size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Text("News App", style: theme.textTheme.headlineSmall?.copyWith(color: Colors.black),),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: provider.goHome,
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.white, size: 35,),
                SizedBox(width: 10,),
                Text("Go to Home", style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
