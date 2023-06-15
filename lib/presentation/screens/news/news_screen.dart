import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshopodc/business_logic/news/news_cubit.dart';
import 'package:workshopodc/data/models/news_model.dart';

import '../../../constants/app_colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsCubit>().getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.white,),
        title: Text("News",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
      body:BlocConsumer<NewsCubit, NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ListView.builder(
        itemCount: NewsModel.dataList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: CircleAvatar(
                    radius: 30.sp,
                    backgroundImage:  NetworkImage(NewsModel.dataList[index].imageUrl.toString()),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                       Text(NewsModel.dataList[index].title.toString()),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 1.5.h),
                        child: Text(NewsModel.dataList[index].body.toString(),maxLines: 2,style: TextStyle(fontSize: 8.sp),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },

      );
  },
),
    );
  }
}

