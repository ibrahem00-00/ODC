import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../data/models/mid_term_item_model.dart';
import '../../../views/mid_term_item.dart';

class MidTermsScreen extends StatelessWidget {
  MidTermsScreen({Key? key}) : super(key: key);
  List<MidTermItemModel> midTermItemModelDataList = [
    MidTermItemModel(
        title: 'Flutter',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'React',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'Flutter',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),

    MidTermItemModel(
        title: 'React',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'Vue',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'Flutter',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
    MidTermItemModel(
        title: 'React',
        duration: '2hrs',
        endTime: '2:00pm',
        examDate: '2022-08-18',
        startTime: '12:00pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.white,),
        title: Text("Mid Terms",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: midTermItemModelDataList.length,
          itemBuilder: (context, index) => CustomMidTermItem(
              midTermItemModel: midTermItemModelDataList[index]),
        ),
      ),
    );
  }
}
