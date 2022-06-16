
abstract class AuthState{
  AuthState();
}

class AuthInitial extends AuthState{
  AuthInitial();
}

class AuthLoading extends AuthState{
  AuthLoading();
}

class SignUpState extends AuthState{
  SignUpState();
}

class SignInState extends AuthState{
  SignInState();
}

class ProfileState extends AuthState{
  ProfileState();
}

class AuthComplete extends AuthState{
  AuthComplete();
}

class AuthError extends AuthState{
  var errorText;
  AuthError({required this.errorText});
}