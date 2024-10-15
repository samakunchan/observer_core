// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposed_service_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProposedServiceDTO _$ProposedServiceDTOFromJson(Map<String, dynamic> json) {
  return _ProposedServiceDTO.fromJson(json);
}

/// @nodoc
mixin _$ProposedServiceDTO {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ProposedServiceDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProposedServiceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProposedServiceDTOCopyWith<ProposedServiceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposedServiceDTOCopyWith<$Res> {
  factory $ProposedServiceDTOCopyWith(
          ProposedServiceDTO value, $Res Function(ProposedServiceDTO) then) =
      _$ProposedServiceDTOCopyWithImpl<$Res, ProposedServiceDTO>;
  @useResult
  $Res call(
      {String title, String content, bool isPublished, String? icon, int? id});
}

/// @nodoc
class _$ProposedServiceDTOCopyWithImpl<$Res, $Val extends ProposedServiceDTO>
    implements $ProposedServiceDTOCopyWith<$Res> {
  _$ProposedServiceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProposedServiceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? isPublished = null,
    Object? icon = freezed,
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
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProposedServiceDTOImplCopyWith<$Res>
    implements $ProposedServiceDTOCopyWith<$Res> {
  factory _$$ProposedServiceDTOImplCopyWith(_$ProposedServiceDTOImpl value,
          $Res Function(_$ProposedServiceDTOImpl) then) =
      __$$ProposedServiceDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String content, bool isPublished, String? icon, int? id});
}

/// @nodoc
class __$$ProposedServiceDTOImplCopyWithImpl<$Res>
    extends _$ProposedServiceDTOCopyWithImpl<$Res, _$ProposedServiceDTOImpl>
    implements _$$ProposedServiceDTOImplCopyWith<$Res> {
  __$$ProposedServiceDTOImplCopyWithImpl(_$ProposedServiceDTOImpl _value,
      $Res Function(_$ProposedServiceDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProposedServiceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? isPublished = null,
    Object? icon = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ProposedServiceDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
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
class _$ProposedServiceDTOImpl implements _ProposedServiceDTO {
  const _$ProposedServiceDTOImpl(
      {required this.title,
      required this.content,
      required this.isPublished,
      this.icon,
      this.id});

  factory _$ProposedServiceDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposedServiceDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final bool isPublished;
  @override
  final String? icon;
  @override
  final int? id;

  @override
  String toString() {
    return 'ProposedServiceDTO(title: $title, content: $content, isPublished: $isPublished, icon: $icon, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposedServiceDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, content, isPublished, icon, id);

  /// Create a copy of ProposedServiceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposedServiceDTOImplCopyWith<_$ProposedServiceDTOImpl> get copyWith =>
      __$$ProposedServiceDTOImplCopyWithImpl<_$ProposedServiceDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposedServiceDTOImplToJson(
      this,
    );
  }
}

abstract class _ProposedServiceDTO implements ProposedServiceDTO {
  const factory _ProposedServiceDTO(
      {required final String title,
      required final String content,
      required final bool isPublished,
      final String? icon,
      final int? id}) = _$ProposedServiceDTOImpl;

  factory _ProposedServiceDTO.fromJson(Map<String, dynamic> json) =
      _$ProposedServiceDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  bool get isPublished;
  @override
  String? get icon;
  @override
  int? get id;

  /// Create a copy of ProposedServiceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProposedServiceDTOImplCopyWith<_$ProposedServiceDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
