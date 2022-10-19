import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadowingspeech/app/i10n.dart';
import 'package:shadowingspeech/app/ui/study/player_page.dart';

class TodayStudyCard extends StatefulWidget {
  const TodayStudyCard({super.key});

  @override
  State<StatefulWidget> createState() => _TodayStudyCardState();
}

class _TodayStudyCardState extends State<TodayStudyCard> {
  void startStudy() async {
    final requestRefresh = await Get.toNamed(
      PlayerPage.routeName,
    );

    if (requestRefresh == true) {
      reload();
    }
  }

  void reload() async {}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        child: Column(
          children: [
            Text(
              "오늘의 학습",
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45.0),
              ),
              onPressed: startStudy,
              icon: const Icon(Icons.play_arrow),
              label: Text(i10n(context).playStudyButtonLabel),
            )
          ],
        ),
      ),
    );
  }
}
