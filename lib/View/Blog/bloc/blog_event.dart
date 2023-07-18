part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class GetBlogTypeList extends BlogEvent {
  const GetBlogTypeList();
}

class GetBlogList extends BlogEvent {
  final int? blogTypeId;
  const GetBlogList({this.blogTypeId});
}
