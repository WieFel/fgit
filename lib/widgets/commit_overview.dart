import 'package:flutter/material.dart';
import 'package:git/git.dart';

class CommitOverview extends StatelessWidget {
  final GitDir gitDir;

  const CommitOverview({Key? key, required this.gitDir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Commits..."),
    );
  }
}
