// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InternshipState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InternshipEntry> entries) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InternshipEntry> entries)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InternshipEntry> entries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipInitial value) initial,
    required TResult Function(InternshipLoading value) loading,
    required TResult Function(InternshipLoaded value) loaded,
    required TResult Function(InternshipError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipInitial value)? initial,
    TResult? Function(InternshipLoading value)? loading,
    TResult? Function(InternshipLoaded value)? loaded,
    TResult? Function(InternshipError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipInitial value)? initial,
    TResult Function(InternshipLoading value)? loading,
    TResult Function(InternshipLoaded value)? loaded,
    TResult Function(InternshipError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternshipStateCopyWith<$Res> {
  factory $InternshipStateCopyWith(
    InternshipState value,
    $Res Function(InternshipState) then,
  ) = _$InternshipStateCopyWithImpl<$Res, InternshipState>;
}

/// @nodoc
class _$InternshipStateCopyWithImpl<$Res, $Val extends InternshipState>
    implements $InternshipStateCopyWith<$Res> {
  _$InternshipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InternshipInitialImplCopyWith<$Res> {
  factory _$$InternshipInitialImplCopyWith(
    _$InternshipInitialImpl value,
    $Res Function(_$InternshipInitialImpl) then,
  ) = __$$InternshipInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternshipInitialImplCopyWithImpl<$Res>
    extends _$InternshipStateCopyWithImpl<$Res, _$InternshipInitialImpl>
    implements _$$InternshipInitialImplCopyWith<$Res> {
  __$$InternshipInitialImplCopyWithImpl(
    _$InternshipInitialImpl _value,
    $Res Function(_$InternshipInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InternshipInitialImpl implements InternshipInitial {
  const _$InternshipInitialImpl();

  @override
  String toString() {
    return 'InternshipState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternshipInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InternshipEntry> entries) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InternshipEntry> entries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InternshipEntry> entries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipInitial value) initial,
    required TResult Function(InternshipLoading value) loading,
    required TResult Function(InternshipLoaded value) loaded,
    required TResult Function(InternshipError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipInitial value)? initial,
    TResult? Function(InternshipLoading value)? loading,
    TResult? Function(InternshipLoaded value)? loaded,
    TResult? Function(InternshipError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipInitial value)? initial,
    TResult Function(InternshipLoading value)? loading,
    TResult Function(InternshipLoaded value)? loaded,
    TResult Function(InternshipError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InternshipInitial implements InternshipState {
  const factory InternshipInitial() = _$InternshipInitialImpl;
}

/// @nodoc
abstract class _$$InternshipLoadingImplCopyWith<$Res> {
  factory _$$InternshipLoadingImplCopyWith(
    _$InternshipLoadingImpl value,
    $Res Function(_$InternshipLoadingImpl) then,
  ) = __$$InternshipLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternshipLoadingImplCopyWithImpl<$Res>
    extends _$InternshipStateCopyWithImpl<$Res, _$InternshipLoadingImpl>
    implements _$$InternshipLoadingImplCopyWith<$Res> {
  __$$InternshipLoadingImplCopyWithImpl(
    _$InternshipLoadingImpl _value,
    $Res Function(_$InternshipLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InternshipLoadingImpl implements InternshipLoading {
  const _$InternshipLoadingImpl();

  @override
  String toString() {
    return 'InternshipState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternshipLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InternshipEntry> entries) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InternshipEntry> entries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InternshipEntry> entries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipInitial value) initial,
    required TResult Function(InternshipLoading value) loading,
    required TResult Function(InternshipLoaded value) loaded,
    required TResult Function(InternshipError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipInitial value)? initial,
    TResult? Function(InternshipLoading value)? loading,
    TResult? Function(InternshipLoaded value)? loaded,
    TResult? Function(InternshipError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipInitial value)? initial,
    TResult Function(InternshipLoading value)? loading,
    TResult Function(InternshipLoaded value)? loaded,
    TResult Function(InternshipError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InternshipLoading implements InternshipState {
  const factory InternshipLoading() = _$InternshipLoadingImpl;
}

/// @nodoc
abstract class _$$InternshipLoadedImplCopyWith<$Res> {
  factory _$$InternshipLoadedImplCopyWith(
    _$InternshipLoadedImpl value,
    $Res Function(_$InternshipLoadedImpl) then,
  ) = __$$InternshipLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InternshipEntry> entries});
}

/// @nodoc
class __$$InternshipLoadedImplCopyWithImpl<$Res>
    extends _$InternshipStateCopyWithImpl<$Res, _$InternshipLoadedImpl>
    implements _$$InternshipLoadedImplCopyWith<$Res> {
  __$$InternshipLoadedImplCopyWithImpl(
    _$InternshipLoadedImpl _value,
    $Res Function(_$InternshipLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entries = null}) {
    return _then(
      _$InternshipLoadedImpl(
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<InternshipEntry>,
      ),
    );
  }
}

/// @nodoc

class _$InternshipLoadedImpl implements InternshipLoaded {
  const _$InternshipLoadedImpl({required final List<InternshipEntry> entries})
    : _entries = entries;

  final List<InternshipEntry> _entries;
  @override
  List<InternshipEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'InternshipState.loaded(entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternshipLoadedImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternshipLoadedImplCopyWith<_$InternshipLoadedImpl> get copyWith =>
      __$$InternshipLoadedImplCopyWithImpl<_$InternshipLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InternshipEntry> entries) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InternshipEntry> entries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InternshipEntry> entries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipInitial value) initial,
    required TResult Function(InternshipLoading value) loading,
    required TResult Function(InternshipLoaded value) loaded,
    required TResult Function(InternshipError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipInitial value)? initial,
    TResult? Function(InternshipLoading value)? loading,
    TResult? Function(InternshipLoaded value)? loaded,
    TResult? Function(InternshipError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipInitial value)? initial,
    TResult Function(InternshipLoading value)? loading,
    TResult Function(InternshipLoaded value)? loaded,
    TResult Function(InternshipError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InternshipLoaded implements InternshipState {
  const factory InternshipLoaded({
    required final List<InternshipEntry> entries,
  }) = _$InternshipLoadedImpl;

  List<InternshipEntry> get entries;

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternshipLoadedImplCopyWith<_$InternshipLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternshipErrorImplCopyWith<$Res> {
  factory _$$InternshipErrorImplCopyWith(
    _$InternshipErrorImpl value,
    $Res Function(_$InternshipErrorImpl) then,
  ) = __$$InternshipErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InternshipErrorImplCopyWithImpl<$Res>
    extends _$InternshipStateCopyWithImpl<$Res, _$InternshipErrorImpl>
    implements _$$InternshipErrorImplCopyWith<$Res> {
  __$$InternshipErrorImplCopyWithImpl(
    _$InternshipErrorImpl _value,
    $Res Function(_$InternshipErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$InternshipErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InternshipErrorImpl implements InternshipError {
  const _$InternshipErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'InternshipState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternshipErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InternshipErrorImplCopyWith<_$InternshipErrorImpl> get copyWith =>
      __$$InternshipErrorImplCopyWithImpl<_$InternshipErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InternshipEntry> entries) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InternshipEntry> entries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InternshipEntry> entries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternshipInitial value) initial,
    required TResult Function(InternshipLoading value) loading,
    required TResult Function(InternshipLoaded value) loaded,
    required TResult Function(InternshipError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternshipInitial value)? initial,
    TResult? Function(InternshipLoading value)? loading,
    TResult? Function(InternshipLoaded value)? loaded,
    TResult? Function(InternshipError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternshipInitial value)? initial,
    TResult Function(InternshipLoading value)? loading,
    TResult Function(InternshipLoaded value)? loaded,
    TResult Function(InternshipError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InternshipError implements InternshipState {
  const factory InternshipError({required final String message}) =
      _$InternshipErrorImpl;

  String get message;

  /// Create a copy of InternshipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InternshipErrorImplCopyWith<_$InternshipErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
