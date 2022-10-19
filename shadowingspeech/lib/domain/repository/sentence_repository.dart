import 'package:shadowingspeech/domain/model/sentence.dart';

abstract class SentenceRepository {
  Future<List<Sentence>> getTodaySentences();
}
