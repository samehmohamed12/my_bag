part of 'register_cubit.dart';

abstract class RegisterState  {
  const RegisterState();
}

class RegisterInitial extends RegisterState {

}

class RegisterInitialState extends RegisterState {

}

class RegisterLoadingState extends RegisterState {

}

class RegisterSuccessState extends RegisterState {
  final AuthModel signUpUserModel;

  const RegisterSuccessState(this.signUpUserModel);


}

class RegisterErrorState extends RegisterState {

}

class SuffixIconState extends RegisterState {

}
