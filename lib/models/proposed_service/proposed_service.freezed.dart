// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposed_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProposedService _$ProposedServiceFromJson(Map<String, dynamic> json) {
  return _ProposedService.fromJson(json);
}

/// @nodoc
mixin _$ProposedService {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ProposedService to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProposedService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProposedServiceCopyWith<ProposedService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposedServiceCopyWith<$Res> {
  factory $ProposedServiceCopyWith(
          ProposedService value, $Res Function(ProposedService) then) =
      _$ProposedServiceCopyWithImpl<$Res, ProposedService>;
  @useResult
  $Res call(
      {String title,
      String content,
      String icon,
      bool isPublished,
      String createdAt,
      String updatedAt,
      String? deletedAt,
      int? id});
}

/// @nodoc
class _$ProposedServiceCopyWithImpl<$Res, $Val extends ProposedService>
    implements $ProposedServiceCopyWith<$Res> {
  _$ProposedServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProposedService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? icon = null,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProposedServiceImplCopyWith<$Res>
    implements $ProposedServiceCopyWith<$Res> {
  factory _$$ProposedServiceImplCopyWith(_$ProposedServiceImpl value,
          $Res Function(_$ProposedServiceImpl) then) =
      __$$ProposedServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      String icon,
      bool isPublished,
      String createdAt,
      String updatedAt,
      String? deletedAt,
      int? id});
}

/// @nodoc
class __$$ProposedServiceImplCopyWithImpl<$Res>
    extends _$ProposedServiceCopyWithImpl<$Res, _$ProposedServiceImpl>
    implements _$$ProposedServiceImplCopyWith<$Res> {
  __$$ProposedServiceImplCopyWithImpl(
      _$ProposedServiceImpl _value, $Res Function(_$ProposedServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProposedService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? icon = null,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ProposedServiceImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProposedServiceImpl implements _ProposedService {
  const _$ProposedServiceImpl(
      {required this.title,
      required this.content,
      required this.icon,
      required this.isPublished,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      this.id});

  factory _$ProposedServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposedServiceImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final String icon;
  @override
  final bool isPublished;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? deletedAt;
  @override
  final int? id;

  @override
  String toString() {
    return 'ProposedService(title: $title, content: $content, icon: $icon, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposedServiceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, icon,
      isPublished, createdAt, updatedAt, deletedAt, id);

  /// Create a copy of ProposedService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposedServiceImplCopyWith<_$ProposedServiceImpl> get copyWith =>
      __$$ProposedServiceImplCopyWithImpl<_$ProposedServiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposedServiceImplToJson(
      this,
    );
  }
}

abstract class _ProposedService implements ProposedService {
  const factory _ProposedService(
      {required final String title,
      required final String content,
      required final String icon,
      required final bool isPublished,
      required final String createdAt,
      required final String updatedAt,
      final String? deletedAt,
      final int? id}) = _$ProposedServiceImpl;

  factory _ProposedService.fromJson(Map<String, dynamic> json) =
      _$ProposedServiceImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  String get icon;
  @override
  bool get isPublished;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get deletedAt;
  @override
  int? get id;

  /// Create a copy of ProposedService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProposedServiceImplCopyWith<_$ProposedServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
