// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
    _$AuthInitialImpl value,
    $Res Function(_$AuthInitialImpl) then,
  ) = __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
    _$AuthInitialImpl _value,
    $Res Function(_$AuthInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl with DiagnosticableTreeMixin implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
    _$AuthLoadingImpl value,
    $Res Function(_$AuthLoadingImpl) then,
  ) = __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
    _$AuthLoadingImpl _value,
    $Res Function(_$AuthLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl with DiagnosticableTreeMixin implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
    _$AuthSuccessImpl value,
    $Res Function(_$AuthSuccessImpl) then,
  ) = __$$AuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String message,
    String? authToken,
    String? rememberMeToken,
    Map<String, dynamic>? user,
  });
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
    _$AuthSuccessImpl _value,
    $Res Function(_$AuthSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? authToken = freezed,
    Object? rememberMeToken = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$AuthSuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        authToken: freezed == authToken
            ? _value.authToken
            : authToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        rememberMeToken: freezed == rememberMeToken
            ? _value.rememberMeToken
            : rememberMeToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        user: freezed == user
            ? _value._user
            : user // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$AuthSuccessImpl with DiagnosticableTreeMixin implements AuthSuccess {
  const _$AuthSuccessImpl({
    required this.message,
    this.authToken,
    this.rememberMeToken,
    final Map<String, dynamic>? user,
  }) : _user = user;

  @override
  final String message;
  @override
  final String? authToken;
  @override
  final String? rememberMeToken;
  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.success(message: $message, authToken: $authToken, rememberMeToken: $rememberMeToken, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.success'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('authToken', authToken))
      ..add(DiagnosticsProperty('rememberMeToken', rememberMeToken))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.rememberMeToken, rememberMeToken) ||
                other.rememberMeToken == rememberMeToken) &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    authToken,
    rememberMeToken,
    const DeepCollectionEquality().hash(_user),
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<_$AuthSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return success(message, authToken, rememberMeToken, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return success?.call(message, authToken, rememberMeToken, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, authToken, rememberMeToken, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess implements AuthState {
  const factory AuthSuccess({
    required final String message,
    final String? authToken,
    final String? rememberMeToken,
    final Map<String, dynamic>? user,
  }) = _$AuthSuccessImpl;

  String get message;
  String? get authToken;
  String? get rememberMeToken;
  Map<String, dynamic>? get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
    _$AuthErrorImpl value,
    $Res Function(_$AuthErrorImpl) then,
  ) = __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
    _$AuthErrorImpl _value,
    $Res Function(_$AuthErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthErrorImpl with DiagnosticableTreeMixin implements AuthError {
  const _$AuthErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError({required final String message}) = _$AuthErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEmailVerificationRequiredImplCopyWith<$Res> {
  factory _$$AuthEmailVerificationRequiredImplCopyWith(
    _$AuthEmailVerificationRequiredImpl value,
    $Res Function(_$AuthEmailVerificationRequiredImpl) then,
  ) = __$$AuthEmailVerificationRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String message,
  });
}

/// @nodoc
class __$$AuthEmailVerificationRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthEmailVerificationRequiredImpl>
    implements _$$AuthEmailVerificationRequiredImplCopyWith<$Res> {
  __$$AuthEmailVerificationRequiredImplCopyWithImpl(
    _$AuthEmailVerificationRequiredImpl _value,
    $Res Function(_$AuthEmailVerificationRequiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? message = null,
  }) {
    return _then(
      _$AuthEmailVerificationRequiredImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        passwordConfirmation: null == passwordConfirmation
            ? _value.passwordConfirmation
            : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthEmailVerificationRequiredImpl
    with DiagnosticableTreeMixin
    implements AuthEmailVerificationRequired {
  const _$AuthEmailVerificationRequiredImpl({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.message,
  });

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.emailVerificationRequired(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.emailVerificationRequired'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('passwordConfirmation', passwordConfirmation))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEmailVerificationRequiredImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    password,
    passwordConfirmation,
    message,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEmailVerificationRequiredImplCopyWith<
    _$AuthEmailVerificationRequiredImpl
  >
  get copyWith =>
      __$$AuthEmailVerificationRequiredImplCopyWithImpl<
        _$AuthEmailVerificationRequiredImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return emailVerificationRequired(
      name,
      email,
      password,
      passwordConfirmation,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return emailVerificationRequired?.call(
      name,
      email,
      password,
      passwordConfirmation,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (emailVerificationRequired != null) {
      return emailVerificationRequired(
        name,
        email,
        password,
        passwordConfirmation,
        message,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return emailVerificationRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return emailVerificationRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (emailVerificationRequired != null) {
      return emailVerificationRequired(this);
    }
    return orElse();
  }
}

abstract class AuthEmailVerificationRequired implements AuthState {
  const factory AuthEmailVerificationRequired({
    required final String name,
    required final String email,
    required final String password,
    required final String passwordConfirmation,
    required final String message,
  }) = _$AuthEmailVerificationRequiredImpl;

  String get name;
  String get email;
  String get password;
  String get passwordConfirmation;
  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthEmailVerificationRequiredImplCopyWith<
    _$AuthEmailVerificationRequiredImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthUnauthenticatedImplCopyWith(
    _$AuthUnauthenticatedImpl value,
    $Res Function(_$AuthUnauthenticatedImpl) then,
  ) = __$$AuthUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticatedImpl>
    implements _$$AuthUnauthenticatedImplCopyWith<$Res> {
  __$$AuthUnauthenticatedImplCopyWithImpl(
    _$AuthUnauthenticatedImpl _value,
    $Res Function(_$AuthUnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthUnauthenticatedImpl
    with DiagnosticableTreeMixin
    implements AuthUnauthenticated {
  const _$AuthUnauthenticatedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.unauthenticated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthState.unauthenticated'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )
    success,
    required TResult Function(String message) error,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )
    emailVerificationRequired,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult? Function(String message)? error,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult? Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      String message,
      String? authToken,
      String? rememberMeToken,
      Map<String, dynamic>? user,
    )?
    success,
    TResult Function(String message)? error,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String message,
    )?
    emailVerificationRequired,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthEmailVerificationRequired value)
    emailVerificationRequired,
    required TResult Function(AuthUnauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    TResult Function(AuthEmailVerificationRequired value)?
    emailVerificationRequired,
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated implements AuthState {
  const factory AuthUnauthenticated() = _$AuthUnauthenticatedImpl;
}
