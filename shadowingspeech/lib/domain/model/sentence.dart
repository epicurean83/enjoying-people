import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence.freezed.dart';
part 'sentence.g.dart';

@freezed
class Sentence with _$Sentence {
  factory Sentence({
    required String id,
    required String documentId,
    required String locale,
    required String text,
    required String hint,
  }) = _Sentence;

  factory Sentence.fromJson(Map<String, dynamic> json) => _$SentenceFromJson(json);
}
