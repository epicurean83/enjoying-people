import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shadowingspeech/app/ui/study/player_bloc.dart';
import 'package:shadowingspeech/data/repository/sentence_repository_impl.dart';
import 'package:shadowingspeech/domain/repository/sentence_repository.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final sample = await rootBundle.loadString("assets/json/sample.json");
  final sampleData = json.decode(sample);

  // repository
  locator.registerLazySingleton<SentenceRepository>(
    () => SentenceRepositoryImpl(sampleData),
  );

  // bloc
  locator.registerFactory<PlayerBloc>(
    () => PlayerBloc(sentenceRepository: locator.get<SentenceRepository>()),
  );
}
