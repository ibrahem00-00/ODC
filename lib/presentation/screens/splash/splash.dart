// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:workshopodc/presentation/screens/login/login_screen.dart';
//
// class Splash extends StatefulWidget {
//    const Splash({Key? key}) : super(key: key);
//
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         const Duration(seconds: 1),
//             () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (BuildContext context) => Login())));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(body: Center(child:Image.asset("images/splash.png"),
//       // Text("Splash Screen")
//     ));
//   }
// }



import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:workshopodc/data_provider/local/cache_helper.dart';
import 'package:workshopodc/presentation/screens/home/home.dart';


import '../../../constants/app_colors.dart';
import '../login/login_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/splash.png",
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.cover,
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2000,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: AppColors.primaryColor,
              onAnimationEnd: () {
                /// TODO : check user access token
                if(CacheHelper.get(key: "logged")==true){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                        (Route<dynamic> route) => false,
                  );
                }else {
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                      (Route<dynamic> route) => false,
                );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

