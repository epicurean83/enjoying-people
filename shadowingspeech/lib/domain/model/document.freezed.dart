// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call({String id, String title, String locale});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$$_DocumentCopyWith(
          _$_Document value, $Res Function(_$_Document) then) =
      __$$_DocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String locale});
}

/// @nodoc
class __$$_DocumentCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$_Document>
    implements _$$_DocumentCopyWith<$Res> {
  __$$_DocumentCopyWithImpl(
      _$_Document _value, $Res Function(_$_Document) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? locale = null,
  }) {
    return _then(_$_Document(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Document implements _Document {
  _$_Document({required this.id, required this.title, required this.locale});

  factory _$_Document.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String locale;

  @override
  String toString() {
    return 'Document(id: $id, title: $title, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Document &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      __$$_DocumentCopyWithImpl<_$_Document>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  factory _Document(
      {required final String id,
      required final String title,
      required final String locale}) = _$_Document;

  factory _Document.fromJson(Map<String, dynamic> json) = _$_Document.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get locale;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentCopyWith<_$_Document> get copyWith =>
      throw _privateConstructorUsedError;
}
