import 'package:ecommerce_bloc/model/auth_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../remote_network/dio_helper.dart';
import '../../remote_network/end_point.dart';
import '../../shared/constant.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  AuthModel? signInModel;

  void signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }).then((value) {
      signInModel = AuthModel.fromJson(value.data);
      emit(RegisterSuccessState(signInModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
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
    emit(SuffixIconState());
  }

  bool showConfirmPassword = false;
  IconData confirmSuffixIcon = Icons.visibility;

  void changeConfirmSuffixIcon(context) {
    showConfirmPassword = !showConfirmPassword;
    if (showConfirmPassword) {
      confirmSuffixIcon = Icons.visibility_off;
    } else {
      confirmSuffixIcon = Icons.visibility;
    }
    emit(SuffixIconState());
  }
}
