import 'package:flutter/material.dart';
import 'package:value_notifier/firstpage.dart';
import 'package:value_notifier/secondpage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ValueNotifier notifier = ValueNotifier(0);
  List screen = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Value Notifier"),
              backgroundColor: Colors.cyan,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "FirstPage"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "SecondPage"),
              ],
              currentIndex: value,
              onTap: (value) {
                notifier.value = value;
              },
            ),
            body: screen[value],
          );
        });
  }
}
