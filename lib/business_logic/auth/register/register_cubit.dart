import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());



  Future postRegister({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "email": email,
      "password": password,
      "name": name,
      "gender": gender,
      "phoneNumber": phoneNumber,
    }).then((value) {
      if (value.statusCode == 200) {
        flutterToast(
          msg: 'Registered Successfully',
          color: Colors.green,
        );
        emit(RegisterSuccessState());
      }else if(value.statusCode == 400){
        flutterToast(
          msg: 'User already exists',
          color: Colors.red,
        );
        emit(RegisterErrorState());
      }
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
      emit(RegisterErrorState());
    });
  }
}
