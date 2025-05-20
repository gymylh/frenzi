import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 64),
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 234, 70, 143),
                Color.fromARGB(255, 237, 120, 67),
              ],
            ),
          ),
          child: SingleChildScrollView(child: Column(children: [...children])),
        ),
      ),
    );
  }
}
