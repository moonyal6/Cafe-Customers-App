import 'package:flutter/material.dart';
import 'package:cafe_customers_app/utilities/of_screen_size.dart';

class PageAppBar extends StatelessWidget {
  const PageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ofScreenWidth(context, 0.025),
          ofScreenHeight(context, 0.038),
          ofScreenWidth(context, 0.025),
          ofScreenHeight(context, 0.006)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.black.withOpacity(0.6),
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.notifications_rounded,
              color: Colors.black.withOpacity(0.6),
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
