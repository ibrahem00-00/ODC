import '../../../data/models/login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}
