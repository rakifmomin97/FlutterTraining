import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name = "Rakif";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome first program by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
