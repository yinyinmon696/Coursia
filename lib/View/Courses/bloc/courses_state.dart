part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class OnTapLoading extends CoursesState {}

class OnTapSuccess extends CoursesState {
  final String type;
  const OnTapSuccess({required this.type});

  @override
  List<Object> get props => [type];
}

class IconTapSuccess extends CoursesState {
  final bool? isIconTap;
  const IconTapSuccess({required this.isIconTap});

  @override
  List<Object> get props => [isIconTap!];
}

class OnTapLessonReviewSuccess extends CoursesState {
  final String? lessonOrReview;
  const OnTapLessonReviewSuccess({required this.lessonOrReview});

  @override
  List<Object> get props => [lessonOrReview!];
}

class GetSubCategoryListLoading extends CoursesState {}

class GetSubCategoryListSuccess extends CoursesState {
  final List<SubCategoryModel> subCategoryList;
  const GetSubCategoryListSuccess({required this.subCategoryList});

  @override
  List<Object> get props => [subCategoryList];
}

class GetSubCategoryListFailed extends CoursesState {
  final String? message;
  const GetSubCategoryListFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class GetCoursesListLoading extends CoursesState {}

class GetCoursesListSuccess extends CoursesState {
  final List<CoursesModel> coursesList;
  final List<String> filterList;
  const GetCoursesListSuccess(
      {required this.coursesList, required this.filterList});

  @override
  List<Object> get props => [coursesList];
}

class GetCoursesListFailed extends CoursesState {
  final String? message;
  const GetCoursesListFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class ScrollLoading extends CoursesState {}

class ScrollSuccess extends CoursesState {
  final bool isScroll;
  const ScrollSuccess({required this.isScroll});

  @override
  List<Object> get props => [isScroll];
}

class PlayVideoLoading extends CoursesState {}

class PlayVideoSuccess extends CoursesState {
  final String videoUrl;
  final int index;
  const PlayVideoSuccess({required this.videoUrl, required this.index});

  @override
  List<Object> get props => [videoUrl, index];
}

class PlayVideoFailed extends CoursesState {
  final String? message;
  const PlayVideoFailed(this.message);

  @override
  List<Object> get props => [message!];
}
