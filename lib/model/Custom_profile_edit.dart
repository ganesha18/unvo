import 'package:flutter/material.dart';

class CustomProfileAppBar extends StatefulWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

  @override
  _CustomProfileAppBarState createState() => _CustomProfileAppBarState();
}

class _CustomProfileAppBarState extends State<CustomProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.black,
      centerTitle: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.https_outlined),
          ),
          Text(
            "StackedList",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.add_box_outlined)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.dehaze_outlined))
      ],
    );
  }
}
