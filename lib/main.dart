import 'package:fgit/widgets/commit_overview.dart';
import 'package:fgit/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:git/git.dart';
import 'package:path/path.dart' as p;

void main() {
  runApp(FGitApp());
}

class FGitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fGit',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("fGit"),
        ),
        body: FutureBuilder<GitDir?>(
          future: _getGitDir(),
          builder: (context, snapshot) => snapshot.hasData
              ? _buildContent(snapshot.data)
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildContent(GitDir? gitDir) => gitDir != null
      ? Row(
          children: [
            SideMenu(gitDir: gitDir),
            Expanded(child: CommitOverview(gitDir: gitDir)),
          ],
        )
      : Center(child: Text("Not a git repository"));

  Future<GitDir?> _getGitDir() async {
    print('Current directory: ${p.current}');

    if (await GitDir.isGitDir(p.current)) {
      return await GitDir.fromExisting(p.current);
    } else {
      return Future.value(null);
    }
  }
}
