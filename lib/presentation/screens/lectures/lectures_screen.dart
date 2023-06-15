import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/business_logic/lectures/lectures_cubit.dart';
import 'package:workshopodc/constants/app_colors.dart';
import 'package:workshopodc/data/models/lectures_model.dart';

class LecturesScreen extends StatefulWidget {
  LecturesScreen({Key? key}) : super(key: key);

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  @override
  void initState() {
    context.read<LecturesCubit>().getLectures();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LecturesCubit, LecturesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            leading: const BackButton(
              color: Colors.white,
            ),
            title: Text(
              "Lectures",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: LecturesModel.dataList.length,
                itemBuilder: (context, index) {
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
                              Text(
                                LecturesModel.dataList[index].lectureSubject
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 16.sp,
                                  ),
                                  Text(LecturesModel.dataList[index].lectureDate
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Exam Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_month_outlined),
                                      Text(LecturesModel
                                          .dataList[index].lectureDate
                                          .toString())
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Start Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.green[200],
                                      ),
                                      Text(LecturesModel
                                          .dataList[index].lectureStartTime
                                          .toString())
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('End Time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later_outlined,
                                          color: Colors.pink[200]),
                                      Text(LecturesModel
                                          .dataList[index].lectureEndTime
                                          .toString())
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        );
      },
    );
  }
}
