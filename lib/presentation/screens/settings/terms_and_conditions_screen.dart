import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black,),
        title: Text("Terms & Conditions",style: TextStyle(fontSize: 20.sp,color: Colors.black),),),
      body:Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: getTerms(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Card(
                              child: Text(
                            snapshot.data,
                            style:
                                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300),
                          ));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })
                ],
              ),
            ),
          ),
      ),
      );
  }
}

Future<String> getTerms() async {
  String terms;
  terms = await Future.delayed(const Duration(seconds: 2))
      .then((value) => "Terms and Conditions\nWelcome to Website Name!\nThese terms and conditions outline the rules and regulations for the use of Company Name's Website, located at Website.com.\nBy accessing this website we assume you accept these terms and conditions. Do not continue to use Website Name if you do not agree to take all of the terms and conditions stated on this page.\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: “Client”, “You” and “Your” refers to you, the person log on this website and compliant to the Company's terms and conditions. “The Company”, “Ourselves”, “We”, “Our” and “Us”, refers to our Company. “Party”, “Parties”, or “Us”, refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client's needs in respect of provision of the Company's stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.\nCookie\nWe employ the use of cookies. By accessing Website Name, you agreed to use cookies in agreement with the Company Name's Privacy Policy.\nMost interactive websites use cookies to let us retrieve the user's details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.\nLicense\nUnless otherwise stated, Company Name and/or its licensors own the intellectual property rights for all material on Website Name. All intellectual property rights are reserved. You may access this from Website Name for your own personal use subjected to restrictions set in these terms and conditions.\nYou must not:\nRepublish material from Website Name\nSell, rent or sub-license material from Website Name\nReproduce, duplicate or copy material from Website Name\nRedistribute content from Website Name\nThis Agreement shall begin on the date hereof.\nParts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Company Name does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Company Name,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Company Name shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.");
      return terms;
}
