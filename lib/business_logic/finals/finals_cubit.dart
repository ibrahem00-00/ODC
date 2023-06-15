import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:workshopodc/constants/end_points.dart';

import '../../data/models/finals_model.dart';
import '../../data/models/login_model.dart';
import '../../data_provider/remote/dio_helper.dart';

part 'finals_state.dart';

class FinalsCubit extends Cubit<FinalsState> {
  FinalsCubit() : super(FinalsInitial());
  Future getFinals()async{
    emit(FinalsLoadingState());
    DioHelper.getData(url: examsEndPoint,token:LoginModel.accessToken).then((value) {
      emit(FinalsSuccessState(finalsModel: FinalsModel.fromJson(value.data)));
    } ).catchError((error){
throw error;
emit(FinalsErrorState());
    });
  }

}
