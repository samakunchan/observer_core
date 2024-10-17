// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReasonModel _$ReasonModelFromJson(Map<String, dynamic> json) {
  return _ReasonModel.fromJson(json);
}

/// @nodoc
mixin _$ReasonModel {
  String get reason => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ReasonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReasonModelCopyWith<ReasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonModelCopyWith<$Res> {
  factory $ReasonModelCopyWith(
          ReasonModel value, $Res Function(ReasonModel) then) =
      _$ReasonModelCopyWithImpl<$Res, ReasonModel>;
  @useResult
  $Res call({String reason, int? id});
}

/// @nodoc
class _$ReasonModelCopyWithImpl<$Res, $Val extends ReasonModel>
    implements $ReasonModelCopyWith<$Res> {
  _$ReasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReasonModelImplCopyWith<$Res>
    implements $ReasonModelCopyWith<$Res> {
  factory _$$ReasonModelImplCopyWith(
          _$ReasonModelImpl value, $Res Function(_$ReasonModelImpl) then) =
      __$$ReasonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason, int? id});
}

/// @nodoc
class __$$ReasonModelImplCopyWithImpl<$Res>
    extends _$ReasonModelCopyWithImpl<$Res, _$ReasonModelImpl>
    implements _$$ReasonModelImplCopyWith<$Res> {
  __$$ReasonModelImplCopyWithImpl(
      _$ReasonModelImpl _value, $Res Function(_$ReasonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? id = freezed,
  }) {
    return _then(_$ReasonModelImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
class _$ReasonModelImpl implements _ReasonModel {
  const _$ReasonModelImpl({required this.reason, this.id});

  factory _$ReasonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReasonModelImplFromJson(json);

  @override
  final String reason;
  @override
  final int? id;

  @override
  String toString() {
    return 'ReasonModel(reason: $reason, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasonModelImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, id);

  /// Create a copy of ReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasonModelImplCopyWith<_$ReasonModelImpl> get copyWith =>
      __$$ReasonModelImplCopyWithImpl<_$ReasonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReasonModelImplToJson(
      this,
    );
  }
}

abstract class _ReasonModel implements ReasonModel {
  const factory _ReasonModel({required final String reason, final int? id}) =
      _$ReasonModelImpl;

  factory _ReasonModel.fromJson(Map<String, dynamic> json) =
      _$ReasonModelImpl.fromJson;

  @override
  String get reason;
  @override
  int? get id;

  /// Create a copy of ReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReasonModelImplCopyWith<_$ReasonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
