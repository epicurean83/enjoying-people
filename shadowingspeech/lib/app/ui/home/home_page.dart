import 'package:ep_core/ui/page.dart';
import 'package:flutter/material.dart';
import 'package:shadowingspeech/app/i10n.dart';
import 'package:shadowingspeech/app/ui/my/profile_view.dart';
import 'package:shadowingspeech/app/ui/study/my_study_view.dart';

class HomePage extends StatefulWidget with UIPage<void> {
  const HomePage({super.key});

  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final tabViews = const <Widget>[
    MyStudyView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViews[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) => setState(() {
          currentIndex = index;
        }),
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.local_library_sharp),
            label: i10n(context).homeTabStudyLabel,
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_circle),
            label: i10n(context).homeTabMyInfoLabel,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(i10n(context).addScriptButtonLabel),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
