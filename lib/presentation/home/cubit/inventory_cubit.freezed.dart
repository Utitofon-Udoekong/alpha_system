// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InventoryState {
  String get success => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;
  String get newItemName => throw _privateConstructorUsedError;
  int get newItemQuantity => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InventoryStateCopyWith<InventoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) then) =
      _$InventoryStateCopyWithImpl<$Res, InventoryState>;
  @useResult
  $Res call(
      {String success,
      String failure,
      String newItemName,
      int newItemQuantity,
      bool isLoading});
}

/// @nodoc
class _$InventoryStateCopyWithImpl<$Res, $Val extends InventoryState>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? failure = null,
    Object? newItemName = null,
    Object? newItemQuantity = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      newItemName: null == newItemName
          ? _value.newItemName
          : newItemName // ignore: cast_nullable_to_non_nullable
              as String,
      newItemQuantity: null == newItemQuantity
          ? _value.newItemQuantity
          : newItemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryStateImplCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory _$$InventoryStateImplCopyWith(_$InventoryStateImpl value,
          $Res Function(_$InventoryStateImpl) then) =
      __$$InventoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String success,
      String failure,
      String newItemName,
      int newItemQuantity,
      bool isLoading});
}

/// @nodoc
class __$$InventoryStateImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryStateImpl>
    implements _$$InventoryStateImplCopyWith<$Res> {
  __$$InventoryStateImplCopyWithImpl(
      _$InventoryStateImpl _value, $Res Function(_$InventoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? failure = null,
    Object? newItemName = null,
    Object? newItemQuantity = null,
    Object? isLoading = null,
  }) {
    return _then(_$InventoryStateImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
      newItemName: null == newItemName
          ? _value.newItemName
          : newItemName // ignore: cast_nullable_to_non_nullable
              as String,
      newItemQuantity: null == newItemQuantity
          ? _value.newItemQuantity
          : newItemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InventoryStateImpl implements _InventoryState {
  const _$InventoryStateImpl(
      {required this.success,
      required this.failure,
      required this.newItemName,
      required this.newItemQuantity,
      required this.isLoading});

  @override
  final String success;
  @override
  final String failure;
  @override
  final String newItemName;
  @override
  final int newItemQuantity;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'InventoryState(success: $success, failure: $failure, newItemName: $newItemName, newItemQuantity: $newItemQuantity, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryStateImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.newItemName, newItemName) ||
                other.newItemName == newItemName) &&
            (identical(other.newItemQuantity, newItemQuantity) ||
                other.newItemQuantity == newItemQuantity) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, success, failure, newItemName, newItemQuantity, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryStateImplCopyWith<_$InventoryStateImpl> get copyWith =>
      __$$InventoryStateImplCopyWithImpl<_$InventoryStateImpl>(
          this, _$identity);
}

abstract class _InventoryState implements InventoryState {
  const factory _InventoryState(
      {required final String success,
      required final String failure,
      required final String newItemName,
      required final int newItemQuantity,
      required final bool isLoading}) = _$InventoryStateImpl;

  @override
  String get success;
  @override
  String get failure;
  @override
  String get newItemName;
  @override
  int get newItemQuantity;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$InventoryStateImplCopyWith<_$InventoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
