import 'package:flutter/material.dart';
import 'package:git/git.dart';

class SideMenu extends StatelessWidget {
  final GitDir gitDir;

  const SideMenu({Key? key, required this.gitDir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.0,
      child: Column(
        children: [
          DrawerHeader(child: Text(gitDir.path)),
          ListTile(
              title: FutureBuilder<BranchReference>(
            future: gitDir.currentBranch(),
            builder: (context, snapshot) => snapshot.hasData
                ? Text("Current branch: ${snapshot.data?.branchName ?? ""}")
                : CircularProgressIndicator(),
          )),
        ],
      ),
    );
  }
}
