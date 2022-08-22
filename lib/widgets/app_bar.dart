import 'package:flutter/material.dart';

import '../style_color/my_app_theme.dart';
import '../style_color/stylesTheme.dart';

AppBar myAppBar(myStyleThemeProvider) {
  double sizeWith = 130;
  return AppBar(
    title: Text('Custom Paint'),
    toolbarHeight: 40,
    actions: [
      PopupMenuButton(
        icon: Icon(Icons.color_lens),
        tooltip: 'тема',
        iconSize: 30,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 0,
            child: Text(
              'Выберите тему:',
              textAlign: TextAlign.center,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: SizedBox(
              width: sizeWith,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent),
                ),
                onPressed: () {
                  themeInitial(myStyleThemeProvider: myStyleThemeProvider);
                },
                child: Text('Default'),
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: SizedBox(
              width: sizeWith,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  themeTwo(myStyleThemeProvider: myStyleThemeProvider);
                },
                child: Text('Светофор'),
              ),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: SizedBox(
              width: sizeWith,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black38),
                ),
                onPressed: () {
                  themeTree(myStyleThemeProvider: myStyleThemeProvider);
                },
                child: Text('Ночная'),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
