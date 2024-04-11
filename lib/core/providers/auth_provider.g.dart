// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authHash() => r'315306ebfeaeaf0bd84b80ca6f9e8a6297f66be4';

/// See also [auth].
@ProviderFor(auth)
final authProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$firestoreHash() => r'57116d7f1e2dda861cf1362ca8fe50edc7a149b3';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = AutoDisposeProvider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$authRepositoryHash() => r'12f4b7d6957d1aa48632fef8c39bcdb067d545e9';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$firestoreRepoHash() => r'26fcf307177023ca1ccb72e4a8bf5c470f5442aa';

/// See also [firestoreRepo].
@ProviderFor(firestoreRepo)
final firestoreRepoProvider = AutoDisposeProvider<FirestoreRepo>.internal(
  firestoreRepo,
  name: r'firestoreRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRepoRef = AutoDisposeProviderRef<FirestoreRepo>;
String _$authStateHash() => r'6c6cb30f0730c18a70c85ac15f299f365f4ad292';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = AutoDisposeStreamProvider<User?>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = AutoDisposeStreamProviderRef<User?>;
String _$signInWithPasswordHash() =>
    r'42f25ea3ff3c1641a1668e1304b2df2ef4e533b4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [signInWithPassword].
@ProviderFor(signInWithPassword)
const signInWithPasswordProvider = SignInWithPasswordFamily();

/// See also [signInWithPassword].
class SignInWithPasswordFamily extends Family<AsyncValue<UsersModel?>> {
  /// See also [signInWithPassword].
  const SignInWithPasswordFamily();

  /// See also [signInWithPassword].
  SignInWithPasswordProvider call(
    String email,
    String password,
  ) {
    return SignInWithPasswordProvider(
      email,
      password,
    );
  }

  @override
  SignInWithPasswordProvider getProviderOverride(
    covariant SignInWithPasswordProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signInWithPasswordProvider';
}

/// See also [signInWithPassword].
class SignInWithPasswordProvider
    extends AutoDisposeFutureProvider<UsersModel?> {
  /// See also [signInWithPassword].
  SignInWithPasswordProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => signInWithPassword(
            ref as SignInWithPasswordRef,
            email,
            password,
          ),
          from: signInWithPasswordProvider,
          name: r'signInWithPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInWithPasswordHash,
          dependencies: SignInWithPasswordFamily._dependencies,
          allTransitiveDependencies:
              SignInWithPasswordFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  SignInWithPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<UsersModel?> Function(SignInWithPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInWithPasswordProvider._internal(
        (ref) => create(ref as SignInWithPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UsersModel?> createElement() {
    return _SignInWithPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInWithPasswordProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInWithPasswordRef on AutoDisposeFutureProviderRef<UsersModel?> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignInWithPasswordProviderElement
    extends AutoDisposeFutureProviderElement<UsersModel?>
    with SignInWithPasswordRef {
  _SignInWithPasswordProviderElement(super.provider);

  @override
  String get email => (origin as SignInWithPasswordProvider).email;
  @override
  String get password => (origin as SignInWithPasswordProvider).password;
}

String _$createAccountWithPasswordHash() =>
    r'ebc2fcc5b65579d095291cf1c5f1bdded7f3833c';

/// See also [createAccountWithPassword].
@ProviderFor(createAccountWithPassword)
const createAccountWithPasswordProvider = CreateAccountWithPasswordFamily();

/// See also [createAccountWithPassword].
class CreateAccountWithPasswordFamily extends Family<AsyncValue<UsersModel?>> {
  /// See also [createAccountWithPassword].
  const CreateAccountWithPasswordFamily();

  /// See also [createAccountWithPassword].
  CreateAccountWithPasswordProvider call({
    required String fullName,
    required String email,
    required String password,
  }) {
    return CreateAccountWithPasswordProvider(
      fullName: fullName,
      email: email,
      password: password,
    );
  }

  @override
  CreateAccountWithPasswordProvider getProviderOverride(
    covariant CreateAccountWithPasswordProvider provider,
  ) {
    return call(
      fullName: provider.fullName,
      email: provider.email,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createAccountWithPasswordProvider';
}

/// See also [createAccountWithPassword].
class CreateAccountWithPasswordProvider
    extends AutoDisposeFutureProvider<UsersModel?> {
  /// See also [createAccountWithPassword].
  CreateAccountWithPasswordProvider({
    required String fullName,
    required String email,
    required String password,
  }) : this._internal(
          (ref) => createAccountWithPassword(
            ref as CreateAccountWithPasswordRef,
            fullName: fullName,
            email: email,
            password: password,
          ),
          from: createAccountWithPasswordProvider,
          name: r'createAccountWithPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createAccountWithPasswordHash,
          dependencies: CreateAccountWithPasswordFamily._dependencies,
          allTransitiveDependencies:
              CreateAccountWithPasswordFamily._allTransitiveDependencies,
          fullName: fullName,
          email: email,
          password: password,
        );

  CreateAccountWithPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullName,
    required this.email,
    required this.password,
  }) : super.internal();

  final String fullName;
  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<UsersModel?> Function(CreateAccountWithPasswordRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateAccountWithPasswordProvider._internal(
        (ref) => create(ref as CreateAccountWithPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullName: fullName,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UsersModel?> createElement() {
    return _CreateAccountWithPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateAccountWithPasswordProvider &&
        other.fullName == fullName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateAccountWithPasswordRef
    on AutoDisposeFutureProviderRef<UsersModel?> {
  /// The parameter `fullName` of this provider.
  String get fullName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _CreateAccountWithPasswordProviderElement
    extends AutoDisposeFutureProviderElement<UsersModel?>
    with CreateAccountWithPasswordRef {
  _CreateAccountWithPasswordProviderElement(super.provider);

  @override
  String get fullName => (origin as CreateAccountWithPasswordProvider).fullName;
  @override
  String get email => (origin as CreateAccountWithPasswordProvider).email;
  @override
  String get password => (origin as CreateAccountWithPasswordProvider).password;
}

String _$verifyEmailHash() => r'e89e47a7577933594f6f33981829ac87d621383b';

/// See also [verifyEmail].
@ProviderFor(verifyEmail)
const verifyEmailProvider = VerifyEmailFamily();

/// See also [verifyEmail].
class VerifyEmailFamily extends Family<AsyncValue<UsersModel?>> {
  /// See also [verifyEmail].
  const VerifyEmailFamily();

  /// See also [verifyEmail].
  VerifyEmailProvider call(
    UsersModel data,
  ) {
    return VerifyEmailProvider(
      data,
    );
  }

  @override
  VerifyEmailProvider getProviderOverride(
    covariant VerifyEmailProvider provider,
  ) {
    return call(
      provider.data,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verifyEmailProvider';
}

/// See also [verifyEmail].
class VerifyEmailProvider extends AutoDisposeFutureProvider<UsersModel?> {
  /// See also [verifyEmail].
  VerifyEmailProvider(
    UsersModel data,
  ) : this._internal(
          (ref) => verifyEmail(
            ref as VerifyEmailRef,
            data,
          ),
          from: verifyEmailProvider,
          name: r'verifyEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyEmailHash,
          dependencies: VerifyEmailFamily._dependencies,
          allTransitiveDependencies:
              VerifyEmailFamily._allTransitiveDependencies,
          data: data,
        );

  VerifyEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final UsersModel data;

  @override
  Override overrideWith(
    FutureOr<UsersModel?> Function(VerifyEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyEmailProvider._internal(
        (ref) => create(ref as VerifyEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UsersModel?> createElement() {
    return _VerifyEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyEmailProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyEmailRef on AutoDisposeFutureProviderRef<UsersModel?> {
  /// The parameter `data` of this provider.
  UsersModel get data;
}

class _VerifyEmailProviderElement
    extends AutoDisposeFutureProviderElement<UsersModel?> with VerifyEmailRef {
  _VerifyEmailProviderElement(super.provider);

  @override
  UsersModel get data => (origin as VerifyEmailProvider).data;
}

String _$signInWithGoogleHash() => r'd7216c4eb4678d51511b96f721c02879e6dfee26';

/// See also [signInWithGoogle].
@ProviderFor(signInWithGoogle)
final signInWithGoogleProvider =
    AutoDisposeFutureProvider<UsersModel?>.internal(
  signInWithGoogle,
  name: r'signInWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInWithGoogleRef = AutoDisposeFutureProviderRef<UsersModel?>;
String _$sendRecoveryEmailHash() => r'93823c3a169a4bc99027dc9f041af4a72ae40e26';

/// See also [sendRecoveryEmail].
@ProviderFor(sendRecoveryEmail)
const sendRecoveryEmailProvider = SendRecoveryEmailFamily();

/// See also [sendRecoveryEmail].
class SendRecoveryEmailFamily extends Family<AsyncValue<void>> {
  /// See also [sendRecoveryEmail].
  const SendRecoveryEmailFamily();

  /// See also [sendRecoveryEmail].
  SendRecoveryEmailProvider call(
    String email,
  ) {
    return SendRecoveryEmailProvider(
      email,
    );
  }

  @override
  SendRecoveryEmailProvider getProviderOverride(
    covariant SendRecoveryEmailProvider provider,
  ) {
    return call(
      provider.email,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sendRecoveryEmailProvider';
}

/// See also [sendRecoveryEmail].
class SendRecoveryEmailProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendRecoveryEmail].
  SendRecoveryEmailProvider(
    String email,
  ) : this._internal(
          (ref) => sendRecoveryEmail(
            ref as SendRecoveryEmailRef,
            email,
          ),
          from: sendRecoveryEmailProvider,
          name: r'sendRecoveryEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendRecoveryEmailHash,
          dependencies: SendRecoveryEmailFamily._dependencies,
          allTransitiveDependencies:
              SendRecoveryEmailFamily._allTransitiveDependencies,
          email: email,
        );

  SendRecoveryEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendRecoveryEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendRecoveryEmailProvider._internal(
        (ref) => create(ref as SendRecoveryEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendRecoveryEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendRecoveryEmailProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendRecoveryEmailRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;
}

class _SendRecoveryEmailProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendRecoveryEmailRef {
  _SendRecoveryEmailProviderElement(super.provider);

  @override
  String get email => (origin as SendRecoveryEmailProvider).email;
}

String _$signOutHash() => r'0acbbe93f1f8accd3889423a42564c2f19855909';

/// See also [signOut].
@ProviderFor(signOut)
final signOutProvider = AutoDisposeFutureProvider<void>.internal(
  signOut,
  name: r'signOutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignOutRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
