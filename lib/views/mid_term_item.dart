import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../data/models/mid_term_item_model.dart';
class CustomMidTermItem extends StatelessWidget {
   CustomMidTermItem({required this.midTermItemModel,Key? key}) : super(key: key);
   MidTermItemModel midTermItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(midTermItemModel.title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Row(children: [
                  Icon(Icons.timer,size: 16.sp,),
                  Text(midTermItemModel.duration)
                ],)
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Exam Date',style: TextStyle(fontWeight: FontWeight.w300),),
                  Row(
                    children: [
                    const Icon(Icons.calendar_month_outlined),
                    Text(midTermItemModel.examDate)
                  ],)
                ],),
                Column(children: [
                  const Text('Start Time',style: TextStyle(fontWeight: FontWeight.w300)),
                  Row(children: [
                    Icon(Icons.watch_later_outlined,color: Colors.green[200],),
                    Text(midTermItemModel.startTime)
                  ],)
                ],),
                Column(children: [
                  const Text('End Time',style: TextStyle(fontWeight: FontWeight.w300)),
                  Row(children: [
                    Icon(Icons.watch_later_outlined,color: Colors.pink[200]),
                    Text(midTermItemModel.endTime)
                  ],)
                ],),
              ],
            )
          ],
        ),
      ),
    );
  }
}
