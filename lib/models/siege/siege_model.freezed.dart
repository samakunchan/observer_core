// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'siege_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiegeModel _$SiegeModelFromJson(Map<String, dynamic> json) {
  return _SiegeModel.fromJson(json);
}

/// @nodoc
mixin _$SiegeModel {
  String get siret => throw _privateConstructorUsedError;
  @JsonKey(name: 'numero_voie')
  int get streetNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'indice_repetition')
  String? get indiceRepetition => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_voie')
  String get streetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'libelle_voie')
  String get streetLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'complement_adresse')
  String get additionnalAddressInfos => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse_ligne_1')
  String get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse_ligne_2')
  String get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_postal')
  String get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ville')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'pays')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_pays')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String get lng => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this SiegeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiegeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiegeModelCopyWith<SiegeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiegeModelCopyWith<$Res> {
  factory $SiegeModelCopyWith(
          SiegeModel value, $Res Function(SiegeModel) then) =
      _$SiegeModelCopyWithImpl<$Res, SiegeModel>;
  @useResult
  $Res call(
      {String siret,
      @JsonKey(name: 'numero_voie') int streetNumber,
      @JsonKey(name: 'indice_repetition') String? indiceRepetition,
      @JsonKey(name: 'type_voie') String streetType,
      @JsonKey(name: 'libelle_voie') String streetLabel,
      @JsonKey(name: 'complement_adresse') String additionnalAddressInfos,
      @JsonKey(name: 'adresse_ligne_1') String address1,
      @JsonKey(name: 'adresse_ligne_2') String address2,
      @JsonKey(name: 'code_postal') String zipCode,
      @JsonKey(name: 'ville') String city,
      @JsonKey(name: 'pays') String country,
      @JsonKey(name: 'code_pays') String countryCode,
      @JsonKey(name: 'latitude') String lat,
      @JsonKey(name: 'longitude') String lng,
      int? id});
}

/// @nodoc
class _$SiegeModelCopyWithImpl<$Res, $Val extends SiegeModel>
    implements $SiegeModelCopyWith<$Res> {
  _$SiegeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiegeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siret = null,
    Object? streetNumber = null,
    Object? indiceRepetition = freezed,
    Object? streetType = null,
    Object? streetLabel = null,
    Object? additionnalAddressInfos = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? zipCode = null,
    Object? city = null,
    Object? country = null,
    Object? countryCode = null,
    Object? lat = null,
    Object? lng = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      siret: null == siret
          ? _value.siret
          : siret // ignore: cast_nullable_to_non_nullable
              as String,
      streetNumber: null == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as int,
      indiceRepetition: freezed == indiceRepetition
          ? _value.indiceRepetition
          : indiceRepetition // ignore: cast_nullable_to_non_nullable
              as String?,
      streetType: null == streetType
          ? _value.streetType
          : streetType // ignore: cast_nullable_to_non_nullable
              as String,
      streetLabel: null == streetLabel
          ? _value.streetLabel
          : streetLabel // ignore: cast_nullable_to_non_nullable
              as String,
      additionnalAddressInfos: null == additionnalAddressInfos
          ? _value.additionnalAddressInfos
          : additionnalAddressInfos // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiegeModelImplCopyWith<$Res>
    implements $SiegeModelCopyWith<$Res> {
  factory _$$SiegeModelImplCopyWith(
          _$SiegeModelImpl value, $Res Function(_$SiegeModelImpl) then) =
      __$$SiegeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String siret,
      @JsonKey(name: 'numero_voie') int streetNumber,
      @JsonKey(name: 'indice_repetition') String? indiceRepetition,
      @JsonKey(name: 'type_voie') String streetType,
      @JsonKey(name: 'libelle_voie') String streetLabel,
      @JsonKey(name: 'complement_adresse') String additionnalAddressInfos,
      @JsonKey(name: 'adresse_ligne_1') String address1,
      @JsonKey(name: 'adresse_ligne_2') String address2,
      @JsonKey(name: 'code_postal') String zipCode,
      @JsonKey(name: 'ville') String city,
      @JsonKey(name: 'pays') String country,
      @JsonKey(name: 'code_pays') String countryCode,
      @JsonKey(name: 'latitude') String lat,
      @JsonKey(name: 'longitude') String lng,
      int? id});
}

/// @nodoc
class __$$SiegeModelImplCopyWithImpl<$Res>
    extends _$SiegeModelCopyWithImpl<$Res, _$SiegeModelImpl>
    implements _$$SiegeModelImplCopyWith<$Res> {
  __$$SiegeModelImplCopyWithImpl(
      _$SiegeModelImpl _value, $Res Function(_$SiegeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SiegeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siret = null,
    Object? streetNumber = null,
    Object? indiceRepetition = freezed,
    Object? streetType = null,
    Object? streetLabel = null,
    Object? additionnalAddressInfos = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? zipCode = null,
    Object? city = null,
    Object? country = null,
    Object? countryCode = null,
    Object? lat = null,
    Object? lng = null,
    Object? id = freezed,
  }) {
    return _then(_$SiegeModelImpl(
      siret: null == siret
          ? _value.siret
          : siret // ignore: cast_nullable_to_non_nullable
              as String,
      streetNumber: null == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as int,
      indiceRepetition: freezed == indiceRepetition
          ? _value.indiceRepetition
          : indiceRepetition // ignore: cast_nullable_to_non_nullable
              as String?,
      streetType: null == streetType
          ? _value.streetType
          : streetType // ignore: cast_nullable_to_non_nullable
              as String,
      streetLabel: null == streetLabel
          ? _value.streetLabel
          : streetLabel // ignore: cast_nullable_to_non_nullable
              as String,
      additionnalAddressInfos: null == additionnalAddressInfos
          ? _value.additionnalAddressInfos
          : additionnalAddressInfos // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
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
class _$SiegeModelImpl implements _SiegeModel {
  const _$SiegeModelImpl(
      {required this.siret,
      @JsonKey(name: 'numero_voie') required this.streetNumber,
      @JsonKey(name: 'indice_repetition') this.indiceRepetition,
      @JsonKey(name: 'type_voie') required this.streetType,
      @JsonKey(name: 'libelle_voie') required this.streetLabel,
      @JsonKey(name: 'complement_adresse')
      required this.additionnalAddressInfos,
      @JsonKey(name: 'adresse_ligne_1') required this.address1,
      @JsonKey(name: 'adresse_ligne_2') required this.address2,
      @JsonKey(name: 'code_postal') required this.zipCode,
      @JsonKey(name: 'ville') required this.city,
      @JsonKey(name: 'pays') required this.country,
      @JsonKey(name: 'code_pays') required this.countryCode,
      @JsonKey(name: 'latitude') required this.lat,
      @JsonKey(name: 'longitude') required this.lng,
      this.id});

  factory _$SiegeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiegeModelImplFromJson(json);

  @override
  final String siret;
  @override
  @JsonKey(name: 'numero_voie')
  final int streetNumber;
  @override
  @JsonKey(name: 'indice_repetition')
  final String? indiceRepetition;
  @override
  @JsonKey(name: 'type_voie')
  final String streetType;
  @override
  @JsonKey(name: 'libelle_voie')
  final String streetLabel;
  @override
  @JsonKey(name: 'complement_adresse')
  final String additionnalAddressInfos;
  @override
  @JsonKey(name: 'adresse_ligne_1')
  final String address1;
  @override
  @JsonKey(name: 'adresse_ligne_2')
  final String address2;
  @override
  @JsonKey(name: 'code_postal')
  final String zipCode;
  @override
  @JsonKey(name: 'ville')
  final String city;
  @override
  @JsonKey(name: 'pays')
  final String country;
  @override
  @JsonKey(name: 'code_pays')
  final String countryCode;
  @override
  @JsonKey(name: 'latitude')
  final String lat;
  @override
  @JsonKey(name: 'longitude')
  final String lng;
  @override
  final int? id;

  @override
  String toString() {
    return 'SiegeModel(siret: $siret, streetNumber: $streetNumber, indiceRepetition: $indiceRepetition, streetType: $streetType, streetLabel: $streetLabel, additionnalAddressInfos: $additionnalAddressInfos, address1: $address1, address2: $address2, zipCode: $zipCode, city: $city, country: $country, countryCode: $countryCode, lat: $lat, lng: $lng, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiegeModelImpl &&
            (identical(other.siret, siret) || other.siret == siret) &&
            (identical(other.streetNumber, streetNumber) ||
                other.streetNumber == streetNumber) &&
            (identical(other.indiceRepetition, indiceRepetition) ||
                other.indiceRepetition == indiceRepetition) &&
            (identical(other.streetType, streetType) ||
                other.streetType == streetType) &&
            (identical(other.streetLabel, streetLabel) ||
                other.streetLabel == streetLabel) &&
            (identical(
                    other.additionnalAddressInfos, additionnalAddressInfos) ||
                other.additionnalAddressInfos == additionnalAddressInfos) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      siret,
      streetNumber,
      indiceRepetition,
      streetType,
      streetLabel,
      additionnalAddressInfos,
      address1,
      address2,
      zipCode,
      city,
      country,
      countryCode,
      lat,
      lng,
      id);

  /// Create a copy of SiegeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiegeModelImplCopyWith<_$SiegeModelImpl> get copyWith =>
      __$$SiegeModelImplCopyWithImpl<_$SiegeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiegeModelImplToJson(
      this,
    );
  }
}

abstract class _SiegeModel implements SiegeModel {
  const factory _SiegeModel(
      {required final String siret,
      @JsonKey(name: 'numero_voie') required final int streetNumber,
      @JsonKey(name: 'indice_repetition') final String? indiceRepetition,
      @JsonKey(name: 'type_voie') required final String streetType,
      @JsonKey(name: 'libelle_voie') required final String streetLabel,
      @JsonKey(name: 'complement_adresse')
      required final String additionnalAddressInfos,
      @JsonKey(name: 'adresse_ligne_1') required final String address1,
      @JsonKey(name: 'adresse_ligne_2') required final String address2,
      @JsonKey(name: 'code_postal') required final String zipCode,
      @JsonKey(name: 'ville') required final String city,
      @JsonKey(name: 'pays') required final String country,
      @JsonKey(name: 'code_pays') required final String countryCode,
      @JsonKey(name: 'latitude') required final String lat,
      @JsonKey(name: 'longitude') required final String lng,
      final int? id}) = _$SiegeModelImpl;

  factory _SiegeModel.fromJson(Map<String, dynamic> json) =
      _$SiegeModelImpl.fromJson;

  @override
  String get siret;
  @override
  @JsonKey(name: 'numero_voie')
  int get streetNumber;
  @override
  @JsonKey(name: 'indice_repetition')
  String? get indiceRepetition;
  @override
  @JsonKey(name: 'type_voie')
  String get streetType;
  @override
  @JsonKey(name: 'libelle_voie')
  String get streetLabel;
  @override
  @JsonKey(name: 'complement_adresse')
  String get additionnalAddressInfos;
  @override
  @JsonKey(name: 'adresse_ligne_1')
  String get address1;
  @override
  @JsonKey(name: 'adresse_ligne_2')
  String get address2;
  @override
  @JsonKey(name: 'code_postal')
  String get zipCode;
  @override
  @JsonKey(name: 'ville')
  String get city;
  @override
  @JsonKey(name: 'pays')
  String get country;
  @override
  @JsonKey(name: 'code_pays')
  String get countryCode;
  @override
  @JsonKey(name: 'latitude')
  String get lat;
  @override
  @JsonKey(name: 'longitude')
  String get lng;
  @override
  int? get id;

  /// Create a copy of SiegeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiegeModelImplCopyWith<_$SiegeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
