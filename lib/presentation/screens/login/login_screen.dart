import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopodc/business_logic/auth/login/login_cubit.dart';
import 'package:workshopodc/business_logic/auth/login/login_state.dart';
import 'package:workshopodc/data/models/login_model.dart';
import 'package:workshopodc/presentation/screens/register/registration.dart';
import '../../../data_provider/local/cache_helper.dart';
import '../../../widgets/input_field.dart';
import '../home/home.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var cacheHelper =CacheHelper();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(),),
              (route) => false);
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: const TextSpan(
                            text: "Orange",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                          TextSpan(
                            text: ' Digital Center',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ])),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InputField(
                            validation: (String value) {
                              if (value.trim().isEmpty) {
                                return "Required";
                              } else {
                                null;
                              }
                            },
                            controller: emailController,
                            icon: Icons.person,
                            keyboard: TextInputType.emailAddress,
                            label: 'Email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            validation: (String value) {
                              if (value.trim().isEmpty) {
                                return "Required";
                              } else {
                                null;
                              }
                            },
                            controller: passController,
                            icon: Icons.lock,
                            keyboard: TextInputType.text,
                            label: 'Password',
                            isSecure: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18)),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  CacheHelper.put(key: "logged", value: true);
                                  CacheHelper.put(key: "accessToken", value: LoginModel.accessToken);
                                  context.read<LoginCubit>().loginPost(
                                    email: emailController.text, 
                                   password: passController.text);
                                  }
                                },
                              child: const Text(
                                'LogIn',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: .25)),
                              ),
                              const Text(
                                "OR",
                                style: TextStyle(fontSize: 20),
                              ),
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: .25)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18)),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Registration(),));
                              },
                              child: const Text(
                                'Sign Up',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  },
);
  }
}
