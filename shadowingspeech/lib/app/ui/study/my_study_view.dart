import 'package:flutter/material.dart';
import 'package:shadowingspeech/app/i10n.dart';
import 'package:shadowingspeech/app/ui/study/today_study_card.dart';

class MyStudyView extends StatefulWidget {
  const MyStudyView({super.key});

  @override
  State<StatefulWidget> createState() => _MyStudyViewState();
}

class _MyStudyViewState extends State<MyStudyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i10n(context).homeTabStudyLabel),
      ),
      body: Column(
        children: const [
          TodayStudyCard(),
        ],
      ),
    );
  }
}
