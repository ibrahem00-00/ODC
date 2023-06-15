import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/data_provider/local/cache_helper.dart';
import 'package:workshopodc/presentation/screens/settings/our_partners_screen.dart';
import 'package:workshopodc/presentation/screens/settings/support_screen.dart';
import 'package:workshopodc/presentation/screens/settings/terms_and_conditions_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/custom_settings_item.dart';
import '../splash/splash.dart';
import 'fqa_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSettingsItem(txt: 'FQA', screen: FqaScreen()),
            const Divider(
              thickness: .2,
              color: Colors.black,
            ),
            CustomSettingsItem(
                txt: 'Terms & Conditions', screen: TermsAndConditionsScreen()),
            const Divider(
              thickness: .2,
              color: Colors.black,
            ),
            CustomSettingsItem(
                txt: 'Our Partners', screen: const PartnerScreen()),
            const Divider(
              thickness: .2,
              color: Colors.black,
            ),
            CustomSettingsItem(txt: 'Support', screen: SupportScreen()),
            const Divider(
              thickness: .2,
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {
                        showAnimatedDialog(
                          alignment: Alignment.center,
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return ClassicGeneralDialogWidget(
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel')),
                                ElevatedButton(
                                    onPressed: () {
                                      CacheHelper.put(
                                          key: "logged", value: false);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Splash(),
                                          ),
                                          (route) => false);
                                    },
                                    child: const Text('Sure')),
                              ],
                              negativeText: 'Cancel',
                              positiveText: 'Sure',
                              titleText: 'Log Out ',
                              contentText: 'Are you sure?',
                            );
                          },
                          animationType: DialogTransitionType.none,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            //CustomSettingsItem(txt: 'Log Out',screen: LogOutScreen()),
          ],
        ),
      ),
    );
  }
}
