import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopodc/business_logic/auth/register/register_cubit.dart';
import 'package:workshopodc/presentation/screens/home/home.dart';
import '../../../widgets/input_field.dart';
import '../login/login_screen.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var universityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
         if (state is RegisterSuccessState) {
           Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(
                 builder: (context) => Login(),
             ),
             (route) => false);
         }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
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
                        flex: 6,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InputField(
                                controller: nameController,
                                keyboard: TextInputType.text,
                                validation: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Name';
                                  } else if (value.length > 32) {
                                    return 'Name Must be less than 32 characters';
                                  }
                                },
                                label: 'Name',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                controller: emailController,
                                keyboard: TextInputType.emailAddress,
                                validation: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Email';
                                  } else if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                      .hasMatch(value)) {
                                    return 'Please Enter Valid as example@gmail.com';
                                  }
                                },
                                label: 'Email',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                  controller: passwordController,
                                  validation: (String value) {
                                    if (value.trim().isEmpty) {
                                      return 'Please Enter Your Password';
                                    }
                                  },
                                  label: 'Password',
                                  isSecure: true),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                  controller: confirmPasswordController,
                                  validation: (String value) {
                                    if (value.trim().isEmpty) {
                                      return 'Please Enter Your Confirm Password';
                                    } else if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      return "Password doesn't match";
                                    }
                                  },
                                  label: 'Confirm Password',
                                  isSecure: true),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                controller: phoneNumberController,
                                keyboard: TextInputType.phone,
                                validation: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Phone Number';
                                  } else if (value.length != 11) {
                                    return "Phone Number Must be 11 Number";
                                  }
                                },
                                label: 'Phone Number',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                controller: universityController,
                                validation: (String value) {
                                  if (value.trim().isEmpty) {
                                    return 'Required';
                                  }
                                },
                                label: 'University',
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
                                      context.read<RegisterCubit>().postRegister(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                            gender: 'm',
                                            phoneNumber: '01069041920',
                                          );
                                    }
                                  },
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
