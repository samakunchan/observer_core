// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillsDTO _$SkillsDTOFromJson(Map<String, dynamic> json) {
  return _SkillsDTO.fromJson(json);
}

/// @nodoc
mixin _$SkillsDTO {
  String get techno => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this SkillsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillsDTOCopyWith<SkillsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsDTOCopyWith<$Res> {
  factory $SkillsDTOCopyWith(SkillsDTO value, $Res Function(SkillsDTO) then) =
      _$SkillsDTOCopyWithImpl<$Res, SkillsDTO>;
  @useResult
  $Res call({String techno, String level, String position, int? id});
}

/// @nodoc
class _$SkillsDTOCopyWithImpl<$Res, $Val extends SkillsDTO>
    implements $SkillsDTOCopyWith<$Res> {
  _$SkillsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techno = null,
    Object? level = null,
    Object? position = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      techno: null == techno
          ? _value.techno
          : techno // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillsDTOImplCopyWith<$Res>
    implements $SkillsDTOCopyWith<$Res> {
  factory _$$SkillsDTOImplCopyWith(
          _$SkillsDTOImpl value, $Res Function(_$SkillsDTOImpl) then) =
      __$$SkillsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String techno, String level, String position, int? id});
}

/// @nodoc
class __$$SkillsDTOImplCopyWithImpl<$Res>
    extends _$SkillsDTOCopyWithImpl<$Res, _$SkillsDTOImpl>
    implements _$$SkillsDTOImplCopyWith<$Res> {
  __$$SkillsDTOImplCopyWithImpl(
      _$SkillsDTOImpl _value, $Res Function(_$SkillsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techno = null,
    Object? level = null,
    Object? position = null,
    Object? id = freezed,
  }) {
    return _then(_$SkillsDTOImpl(
      techno: null == techno
          ? _value.techno
          : techno // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillsDTOImpl implements _SkillsDTO {
  const _$SkillsDTOImpl(
      {required this.techno,
      required this.level,
      required this.position,
      this.id});

  factory _$SkillsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillsDTOImplFromJson(json);

  @override
  final String techno;
  @override
  final String level;
  @override
  final String position;
  @override
  final int? id;

  @override
  String toString() {
    return 'SkillsDTO(techno: $techno, level: $level, position: $position, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsDTOImpl &&
            (identical(other.techno, techno) || other.techno == techno) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, techno, level, position, id);

  /// Create a copy of SkillsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsDTOImplCopyWith<_$SkillsDTOImpl> get copyWith =>
      __$$SkillsDTOImplCopyWithImpl<_$SkillsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillsDTOImplToJson(
      this,
    );
  }
}

abstract class _SkillsDTO implements SkillsDTO {
  const factory _SkillsDTO(
      {required final String techno,
      required final String level,
      required final String position,
      final int? id}) = _$SkillsDTOImpl;

  factory _SkillsDTO.fromJson(Map<String, dynamic> json) =
      _$SkillsDTOImpl.fromJson;

  @override
  String get techno;
  @override
  String get level;
  @override
  String get position;
  @override
  int? get id;

  /// Create a copy of SkillsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillsDTOImplCopyWith<_$SkillsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
