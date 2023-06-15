part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoadingState extends NewsState {}
class NewsSuccessState extends NewsState {
  NewsModel newsModel;
  NewsSuccessState({required this.newsModel});
}
class NewsErrorState extends NewsState {}
