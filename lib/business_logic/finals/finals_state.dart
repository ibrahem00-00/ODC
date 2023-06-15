part of 'finals_cubit.dart';

@immutable
abstract class FinalsState {}

class FinalsInitial extends FinalsState {}
class FinalsLoadingState extends FinalsState {}
// ignore: must_be_immutable
class FinalsSuccessState extends FinalsState {
  FinalsModel finalsModel;
  FinalsSuccessState({required this.finalsModel});
}
class FinalsErrorState extends FinalsState {}
