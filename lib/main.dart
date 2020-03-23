import 'package:flutter/material.dart';

void main() => runApp(ThemeChanger());

class ThemeChanger extends StatefulWidget {
  @override
  ThemeChangerState createState() => ThemeChangerState();
}

class ThemeChangerState extends State<ThemeChanger> {
  ThemeData currentTheme = ThemeData.light();
  bool lightTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Changer',
      theme: currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme Changer"),
        ),
        body: Center(
          child: Switch(
            key: ValueKey('themeSwitch'),
            value: lightTheme,
            onChanged: (bool newVal) {
              setState(() {
                if (lightTheme) {
                  lightTheme = false;
                  currentTheme = ThemeData.dark();
                } else {
                  lightTheme = true;
                  currentTheme = ThemeData.light();
                }
              },);
            },
            activeColor: Colors.green,
            activeTrackColor: Colors.greenAccent,
            inactiveThumbColor: Colors.blue,
            inactiveTrackColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
