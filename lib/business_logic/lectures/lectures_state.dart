part of 'lectures_cubit.dart';

@immutable
abstract class LecturesState {}

class LecturesInitial extends LecturesState {}
class LecturesLoadingState extends LecturesState {}
// ignore: must_be_immutable
class LecturesSuccessState extends LecturesState {
 LecturesModel lecturesModel;
  LecturesSuccessState({required this.lecturesModel });
}
class LecturesErrorState extends LecturesState {}
