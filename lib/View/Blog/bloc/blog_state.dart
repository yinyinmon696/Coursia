part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogTypeListLoading extends BlogState {}

class BlogTypeListSuccess extends BlogState {
  final List<BlogTypeModel> blogTypeList;
  const BlogTypeListSuccess({required this.blogTypeList});

  @override
  List<Object> get props => [blogTypeList];
}

class BlogTypeListFailed extends BlogState {
  final String? message;
  const BlogTypeListFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class BlogListLoading extends BlogState {}

class BlogListSuccess extends BlogState {
  final List<BlogModel> blogList;
  const BlogListSuccess({required this.blogList});

  @override
  List<Object> get props => [blogList];
}

class BlogListFailed extends BlogState {
  final String? message;
  const BlogListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
