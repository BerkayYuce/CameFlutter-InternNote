// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )
    loginRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    registerRequested,
    required TResult Function(String rememberToken, String deviceName)
    autoLoginRequested,
    required TResult Function() logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult? Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult? Function()? logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(AutoLoginRequested value) autoLoginRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(AutoLoginRequested value)? autoLoginRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(AutoLoginRequested value)? autoLoginRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginRequestedImplCopyWith<$Res> {
  factory _$$LoginRequestedImplCopyWith(
    _$LoginRequestedImpl value,
    $Res Function(_$LoginRequestedImpl) then,
  ) = __$$LoginRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String email,
    String password,
    String deviceName,
    bool rememberMe,
  });
}

/// @nodoc
class __$$LoginRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginRequestedImpl>
    implements _$$LoginRequestedImplCopyWith<$Res> {
  __$$LoginRequestedImplCopyWithImpl(
    _$LoginRequestedImpl _value,
    $Res Function(_$LoginRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? deviceName = null,
    Object? rememberMe = null,
  }) {
    return _then(
      _$LoginRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
        rememberMe: null == rememberMe
            ? _value.rememberMe
            : rememberMe // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoginRequestedImpl
    with DiagnosticableTreeMixin
    implements LoginRequested {
  const _$LoginRequestedImpl({
    required this.email,
    required this.password,
    required this.deviceName,
    required this.rememberMe,
  });

  @override
  final String email;
  @override
  final String password;
  @override
  final String deviceName;
  @override
  final bool rememberMe;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.loginRequested(email: $email, password: $password, deviceName: $deviceName, rememberMe: $rememberMe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.loginRequested'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('deviceName', deviceName))
      ..add(DiagnosticsProperty('rememberMe', rememberMe));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, deviceName, rememberMe);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      __$$LoginRequestedImplCopyWithImpl<_$LoginRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )
    loginRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    registerRequested,
    required TResult Function(String rememberToken, String deviceName)
    autoLoginRequested,
    required TResult Function() logoutRequested,
  }) {
    return loginRequested(email, password, deviceName, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult? Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult? Function()? logoutRequested,
  }) {
    return loginRequested?.call(email, password, deviceName, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(email, password, deviceName, rememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(AutoLoginRequested value) autoLoginRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(AutoLoginRequested value)? autoLoginRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(AutoLoginRequested value)? autoLoginRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(this);
    }
    return orElse();
  }
}

abstract class LoginRequested implements AuthEvent {
  const factory LoginRequested({
    required final String email,
    required final String password,
    required final String deviceName,
    required final bool rememberMe,
  }) = _$LoginRequestedImpl;

  String get email;
  String get password;
  String get deviceName;
  bool get rememberMe;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterRequestedImplCopyWith<$Res> {
  factory _$$RegisterRequestedImplCopyWith(
    _$RegisterRequestedImpl value,
    $Res Function(_$RegisterRequestedImpl) then,
  ) = __$$RegisterRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String deviceName,
  });
}

/// @nodoc
class __$$RegisterRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterRequestedImpl>
    implements _$$RegisterRequestedImplCopyWith<$Res> {
  __$$RegisterRequestedImplCopyWithImpl(
    _$RegisterRequestedImpl _value,
    $Res Function(_$RegisterRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? deviceName = null,
  }) {
    return _then(
      _$RegisterRequestedImpl(
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
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RegisterRequestedImpl
    with DiagnosticableTreeMixin
    implements RegisterRequested {
  const _$RegisterRequestedImpl({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.deviceName,
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
  final String deviceName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.registerRequested(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, deviceName: $deviceName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.registerRequested'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('passwordConfirmation', passwordConfirmation))
      ..add(DiagnosticsProperty('deviceName', deviceName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    password,
    passwordConfirmation,
    deviceName,
  );

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      __$$RegisterRequestedImplCopyWithImpl<_$RegisterRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )
    loginRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    registerRequested,
    required TResult Function(String rememberToken, String deviceName)
    autoLoginRequested,
    required TResult Function() logoutRequested,
  }) {
    return registerRequested(
      name,
      email,
      password,
      passwordConfirmation,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult? Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult? Function()? logoutRequested,
  }) {
    return registerRequested?.call(
      name,
      email,
      password,
      passwordConfirmation,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(
        name,
        email,
        password,
        passwordConfirmation,
        deviceName,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(AutoLoginRequested value) autoLoginRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return registerRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(AutoLoginRequested value)? autoLoginRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return registerRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(AutoLoginRequested value)? autoLoginRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (registerRequested != null) {
      return registerRequested(this);
    }
    return orElse();
  }
}

abstract class RegisterRequested implements AuthEvent {
  const factory RegisterRequested({
    required final String name,
    required final String email,
    required final String password,
    required final String passwordConfirmation,
    required final String deviceName,
  }) = _$RegisterRequestedImpl;

  String get name;
  String get email;
  String get password;
  String get passwordConfirmation;
  String get deviceName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestedImplCopyWith<_$RegisterRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoLoginRequestedImplCopyWith<$Res> {
  factory _$$AutoLoginRequestedImplCopyWith(
    _$AutoLoginRequestedImpl value,
    $Res Function(_$AutoLoginRequestedImpl) then,
  ) = __$$AutoLoginRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rememberToken, String deviceName});
}

/// @nodoc
class __$$AutoLoginRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AutoLoginRequestedImpl>
    implements _$$AutoLoginRequestedImplCopyWith<$Res> {
  __$$AutoLoginRequestedImplCopyWithImpl(
    _$AutoLoginRequestedImpl _value,
    $Res Function(_$AutoLoginRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rememberToken = null, Object? deviceName = null}) {
    return _then(
      _$AutoLoginRequestedImpl(
        rememberToken: null == rememberToken
            ? _value.rememberToken
            : rememberToken // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AutoLoginRequestedImpl
    with DiagnosticableTreeMixin
    implements AutoLoginRequested {
  const _$AutoLoginRequestedImpl({
    required this.rememberToken,
    required this.deviceName,
  });

  @override
  final String rememberToken;
  @override
  final String deviceName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.autoLoginRequested(rememberToken: $rememberToken, deviceName: $deviceName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthEvent.autoLoginRequested'))
      ..add(DiagnosticsProperty('rememberToken', rememberToken))
      ..add(DiagnosticsProperty('deviceName', deviceName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoLoginRequestedImpl &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rememberToken, deviceName);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoLoginRequestedImplCopyWith<_$AutoLoginRequestedImpl> get copyWith =>
      __$$AutoLoginRequestedImplCopyWithImpl<_$AutoLoginRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )
    loginRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    registerRequested,
    required TResult Function(String rememberToken, String deviceName)
    autoLoginRequested,
    required TResult Function() logoutRequested,
  }) {
    return autoLoginRequested(rememberToken, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult? Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult? Function()? logoutRequested,
  }) {
    return autoLoginRequested?.call(rememberToken, deviceName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (autoLoginRequested != null) {
      return autoLoginRequested(rememberToken, deviceName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(AutoLoginRequested value) autoLoginRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return autoLoginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(AutoLoginRequested value)? autoLoginRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return autoLoginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(AutoLoginRequested value)? autoLoginRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (autoLoginRequested != null) {
      return autoLoginRequested(this);
    }
    return orElse();
  }
}

abstract class AutoLoginRequested implements AuthEvent {
  const factory AutoLoginRequested({
    required final String rememberToken,
    required final String deviceName,
  }) = _$AutoLoginRequestedImpl;

  String get rememberToken;
  String get deviceName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoLoginRequestedImplCopyWith<_$AutoLoginRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(
    _$LogoutRequestedImpl value,
    $Res Function(_$LogoutRequestedImpl) then,
  ) = __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
    _$LogoutRequestedImpl _value,
    $Res Function(_$LogoutRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutRequestedImpl
    with DiagnosticableTreeMixin
    implements LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthEvent.logoutRequested'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )
    loginRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    registerRequested,
    required TResult Function(String rememberToken, String deviceName)
    autoLoginRequested,
    required TResult Function() logoutRequested,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult? Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult? Function()? logoutRequested,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String email,
      String password,
      String deviceName,
      bool rememberMe,
    )?
    loginRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    registerRequested,
    TResult Function(String rememberToken, String deviceName)?
    autoLoginRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(RegisterRequested value) registerRequested,
    required TResult Function(AutoLoginRequested value) autoLoginRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(RegisterRequested value)? registerRequested,
    TResult? Function(AutoLoginRequested value)? autoLoginRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(RegisterRequested value)? registerRequested,
    TResult Function(AutoLoginRequested value)? autoLoginRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class LogoutRequested implements AuthEvent {
  const factory LogoutRequested() = _$LogoutRequestedImpl;
}
