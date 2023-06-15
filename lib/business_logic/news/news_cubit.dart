import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshopodc/constants/end_points.dart';
import 'package:workshopodc/data/models/news_model.dart';
import 'package:workshopodc/data_provider/remote/dio_helper.dart';

import '../../data/models/login_model.dart';




part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  Future getNews()async{
    emit(NewsLoadingState());
    DioHelper.getData(url: newsEndPoint,token:LoginModel.accessToken).then((value) {
      print(value);
      emit(NewsSuccessState(newsModel: NewsModel.fromJson(value.data)));
    } ).catchError((error){
      print(error);
      emit(NewsErrorState());
    });
  }

}
