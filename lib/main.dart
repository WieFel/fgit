import 'package:flutter/material.dart';

void main() {
  runApp(FGitApp());
}

class FGitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fGit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("fGit"),
        ),
        body: Center(
          child: Text("fGit"),
        ),
      ),
    );
  }
}
