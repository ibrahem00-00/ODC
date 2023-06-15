import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:workshopodc/constants/end_points.dart';
import 'package:workshopodc/data/models/login_model.dart';

import '../../data/models/lectures_model.dart';
import '../../data_provider/remote/dio_helper.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());
  Future getLectures()async{
    emit(LecturesLoadingState());
     DioHelper.getData(url: lectureEndPoint,token:LoginModel.accessToken).then((value) {
       //print(value);
      emit(LecturesSuccessState(lecturesModel: LecturesModel.fromJson(value.data)));
    } ).catchError((error){
     // print(error);
      emit(LecturesErrorState());
    });
  }
}
