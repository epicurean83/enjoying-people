// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sentence _$$_SentenceFromJson(Map<String, dynamic> json) => _$_Sentence(
      id: json['id'] as String,
      documentId: json['documentId'] as String,
      locale: json['locale'] as String,
      text: json['text'] as String,
      hint: json['hint'] as String,
    );

Map<String, dynamic> _$$_SentenceToJson(_$_Sentence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'locale': instance.locale,
      'text': instance.text,
      'hint': instance.hint,
    };
