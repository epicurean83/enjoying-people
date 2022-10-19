import 'package:objectid/objectid.dart';
import 'package:shadowingspeech/domain/model/sentence.dart';
import 'package:shadowingspeech/domain/repository/sentence_repository.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final dynamic sampleData;

  SentenceRepositoryImpl(this.sampleData);

  @override
  Future<List<Sentence>> getTodaySentences() async {
    final documentId = ObjectId().toString();
    final document = sampleData[0];
    final List sentences = document["script"];
    return sentences
        .map<Sentence>(
          (e) => Sentence(
            id: ObjectId().toString(),
            documentId: documentId,
            locale: document["locale"],
            text: e["sentence"],
            hint: e["hint"],
          ),
        )
        .toList();
  }
}
