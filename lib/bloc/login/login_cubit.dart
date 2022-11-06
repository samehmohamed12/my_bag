import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/auth_model.dart';
import '../../remote_network/dio_helper.dart';
import '../../remote_network/end_point.dart';
import '../../shared/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  AuthModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, token: token, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = AuthModel.fromJson(value.data);
      print(loginModel!.data!.token);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  bool showPassword = false;
  IconData suffixIcon = Icons.visibility;

  void changeSuffixIcon(context) {
    showPassword = !showPassword;
    if (showPassword) {
      suffixIcon = Icons.visibility_off;
    } else {
      suffixIcon = Icons.visibility;
    }
    emit(ChangeSuffixIconState());
  }
}
