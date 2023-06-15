part of 'sections_cubit.dart';

@immutable
abstract class SectionsState {}

class SectionsInitial extends SectionsState {}
class SectionsLoadingState extends SectionsState {}
class SectionsSuccessState extends SectionsState {
  SectionsModel sectionsModel;
  SectionsSuccessState({required this.sectionsModel});
}
class SectionsErrorState extends SectionsState {}
