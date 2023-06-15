import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/models/login_model.dart';
import '../../../data_provider/remote/dio_helper.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future loginPost({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value) {
      if (value.statusCode == 200) {
        flutterToast(msg: 'Logged in Successfully', color: Colors.green);
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
      }
    }).catchError((error) {
      flutterToast(
        msg: 'Email or Password is wrong',
        color: Colors.red,
      );
      emit(LoginErrorState());
    });
  }
}
