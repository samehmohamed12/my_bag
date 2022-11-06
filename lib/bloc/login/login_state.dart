part of 'login_cubit.dart';

abstract class LoginState  {
  const LoginState();
}

class LoginInitialState extends LoginState {

}

class LoginLoadingState extends LoginState {

}

class LoginSuccessState extends LoginState {
  final AuthModel loginModel;

  const LoginSuccessState(this.loginModel);

}

class LoginErrorState extends LoginState {

}

class ChangeSuffixIconState extends LoginState {

}
