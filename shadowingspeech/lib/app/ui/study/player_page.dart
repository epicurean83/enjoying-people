import 'dart:io';

import 'package:ep_core/ui/bloc_provider.dart';
import 'package:ep_core/ui/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:shadowingspeech/app/di/locator.dart';
import 'package:shadowingspeech/app/ui/study/player/controller_view.dart';
import 'package:shadowingspeech/app/ui/study/player_bloc.dart';

final logger = Logger("PlayStudyPage");

class PlayerPage extends StatefulWidget with UIPage<bool> {
  const PlayerPage({super.key});

  static const routeName = "/play";

  @override
  State<StatefulWidget> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late final FlutterTts flutterTts;

  static const sentence1 = "I remember when the heater broke down at my house a few years ago.";
  static const sentence2 = "몇 년 전 집에 히터가 고장 났을 때를 기억합니다.";

  Map<String, String>? enVoice;
  Map<String, String>? koVoice;
  bool isPlaying = false;
  int keywordStartOffset = 0;
  int keywordEndOffset = 0;
  bool enableKeywordOffset = true;

  void initTTS() async {
    flutterTts = FlutterTts();
    bool isAvailable = await flutterTts.isLanguageAvailable("en-US") &&
        await flutterTts.isLanguageAvailable("ko-KR");
    if (!isAvailable) {
      Get.showSnackbar(const GetSnackBar(
        title: "Error",
        message: "해당 언어를 사용할 수 없습니다.",
      ));
      return;
    }

    // if (Platform.isAndroid) {
    //   List<dynamic> engines = await flutterTts.getEngines;
    //   logger.info(await flutterTts.getDefaultEngine);
    //   logger.info(engines.toString());
    //   final targetEngine = engines.firstWhere((element) => element.toString().contains("google"));
    //   if (targetEngine != null) {
    //     await flutterTts.setEngine(targetEngine);
    //     await Future.delayed(const Duration(milliseconds: 500));
    //   }
    // }

    List<dynamic> languages = await flutterTts.getLanguages;
    logger.info(languages.toString());
    await flutterTts.setLanguage("en-US");

    List<dynamic> voices = await flutterTts.getVoices;
    final targetVoices = voices
        .map<Map<String, String>>((e) => {
              "name": e["name"],
              "locale": e["locale"],
            })
        .toList();
    logger.info(targetVoices.toString());
    enVoice = targetVoices.firstWhere((element) => element["locale"] == "en-US");
    koVoice = targetVoices.firstWhere((element) => element["locale"] == "ko-KR");

    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      if (!enableKeywordOffset) return;
      setState(() {
        keywordStartOffset = startOffset;
        keywordEndOffset = endOffset;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        isPlaying = false;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  void play() async {
    await flutterTts.setSpeechRate(Platform.isAndroid ? .5 : .5);
    await flutterTts.setLanguage("en-US");
    if (enVoice != null) await flutterTts.setVoice(enVoice!);
    enableKeywordOffset = true;
    await flutterTts.speak(sentence1);
    await flutterTts.awaitSpeakCompletion(true);
    enableKeywordOffset = false;
    setState(() {
      keywordStartOffset = 0;
      keywordEndOffset = 0;
    });

    if (!isPlaying) return;

    await flutterTts.setSpeechRate(Platform.isAndroid ? .5 : 0.5);
    await flutterTts.setLanguage("ko-KR");
    if (koVoice != null) await flutterTts.setVoice(koVoice!);
    await flutterTts.speak(sentence2);
    await flutterTts.awaitSpeakCompletion(true);

    if (isPlaying) {
      await Future.delayed(const Duration(milliseconds: 300));
      play();
    }
  }

  void stop() async {
    await flutterTts.stop();
    setState(() {
      keywordStartOffset = 0;
      keywordEndOffset = 0;
      isPlaying = false;
    });
  }

  @override
  void initState() {
    initTTS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerBloc>(
      builder: () => locator.get<PlayerBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Expanded(child: buildContent()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
              child: ControllerView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: "",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                children: [
                  TextSpan(text: sentence1.substring(0, keywordStartOffset)),
                  TextSpan(
                    text: sentence1.substring(keywordStartOffset, keywordEndOffset),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(text: sentence1.substring(keywordEndOffset)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              sentence2,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ));
  }
}
