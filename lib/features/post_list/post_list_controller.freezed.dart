// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostListUiState {
  AsyncValue<List<PostResponse>> get postsUiState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostListUiStateCopyWith<PostListUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListUiStateCopyWith<$Res> {
  factory $PostListUiStateCopyWith(
          PostListUiState value, $Res Function(PostListUiState) then) =
      _$PostListUiStateCopyWithImpl<$Res, PostListUiState>;
  @useResult
  $Res call({AsyncValue<List<PostResponse>> postsUiState});
}

/// @nodoc
class _$PostListUiStateCopyWithImpl<$Res, $Val extends PostListUiState>
    implements $PostListUiStateCopyWith<$Res> {
  _$PostListUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsUiState = null,
  }) {
    return _then(_value.copyWith(
      postsUiState: null == postsUiState
          ? _value.postsUiState
          : postsUiState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<PostResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostListUiStateImplCopyWith<$Res>
    implements $PostListUiStateCopyWith<$Res> {
  factory _$$PostListUiStateImplCopyWith(_$PostListUiStateImpl value,
          $Res Function(_$PostListUiStateImpl) then) =
      __$$PostListUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<PostResponse>> postsUiState});
}

/// @nodoc
class __$$PostListUiStateImplCopyWithImpl<$Res>
    extends _$PostListUiStateCopyWithImpl<$Res, _$PostListUiStateImpl>
    implements _$$PostListUiStateImplCopyWith<$Res> {
  __$$PostListUiStateImplCopyWithImpl(
      _$PostListUiStateImpl _value, $Res Function(_$PostListUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsUiState = null,
  }) {
    return _then(_$PostListUiStateImpl(
      postsUiState: null == postsUiState
          ? _value.postsUiState
          : postsUiState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<PostResponse>>,
    ));
  }
}

/// @nodoc

class _$PostListUiStateImpl implements _PostListUiState {
  const _$PostListUiStateImpl({this.postsUiState = const AsyncValue.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<PostResponse>> postsUiState;

  @override
  String toString() {
    return 'PostListUiState(postsUiState: $postsUiState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListUiStateImpl &&
            (identical(other.postsUiState, postsUiState) ||
                other.postsUiState == postsUiState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postsUiState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListUiStateImplCopyWith<_$PostListUiStateImpl> get copyWith =>
      __$$PostListUiStateImplCopyWithImpl<_$PostListUiStateImpl>(
          this, _$identity);
}

abstract class _PostListUiState implements PostListUiState {
  const factory _PostListUiState(
          {final AsyncValue<List<PostResponse>> postsUiState}) =
      _$PostListUiStateImpl;

  @override
  AsyncValue<List<PostResponse>> get postsUiState;
  @override
  @JsonKey(ignore: true)
  _$$PostListUiStateImplCopyWith<_$PostListUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
