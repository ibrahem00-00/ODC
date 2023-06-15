import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/sections/sections_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/sections_model.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  void initState() {
    context.read<SectionsCubit>().getSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionsCubit, SectionsState>(
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
              "Sections",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: SectionsModel.dataList.length,
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
                                SectionsModel.dataList[index].sectionSubject
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
                                  Text(SectionsModel.dataList[index].sectionDate
                                      .toString())
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
                                      Text(SectionsModel
                                          .dataList[index].sectionDate
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
                                      Text(SectionsModel
                                          .dataList[index].sectionStartTime
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
                                      Text(SectionsModel
                                          .dataList[index].sectionEndTime
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
