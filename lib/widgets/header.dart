import 'package:flutter/material.dart';

Widget headerApp(BuildContext context, String text) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            IconButton(
              onPressed: () {
                return Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 35,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
