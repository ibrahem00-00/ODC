import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshopodc/constants/end_points.dart';

import '../../data/models/login_model.dart';
import '../../data/models/sections_model.dart';
import '../../data_provider/remote/dio_helper.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  Future getSections()async{
    emit(SectionsLoadingState());
    DioHelper.getData(url: sectionEndPoint,token:LoginModel.accessToken).then((value) {
      print(value);
      emit(SectionsSuccessState(sectionsModel: SectionsModel.fromJson(value.data)));
    } ).catchError((error){
      emit(SectionsErrorState());
    });
  }
}
