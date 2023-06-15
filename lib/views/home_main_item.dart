import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/data/models/custom_card_model.dart';
import '../constants/app_colors.dart';
class HomeCardItem extends StatelessWidget {
  HomeCardItem({
    required this.homeCardModel,
    Key? key,
  }) : super(key: key);

  CustomCardModel homeCardModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => homeCardModel.screen,
            ));
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 4,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25.sp,
              backgroundColor: Colors.grey[200],
              child: Icon(
                homeCardModel.icon,
                color: AppColors.primaryColor,
                size: 25.sp,
              ),
            ),
            Text(
              homeCardModel.title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
