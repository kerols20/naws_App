import 'package:flutter/material.dart';

class widgetRight extends StatelessWidget {
  widgetRight({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //x/x/x/x/x/x/x/
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("View All ", style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),),
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
      )

    );
  }
}
class WidgetLeft extends StatelessWidget {
  const WidgetLeft({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // /x/x/x/x/x/x
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "View All",
                style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}