import 'package:coursia/Model/blog_model.dart';
import 'package:coursia/Model/blog_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  BlogBloc() : super(BlogInitial()) {
    on<GetBlogTypeList>(_getBlogTypeList);
    on<GetBlogList>(_getBlogList);
  }

  _getBlogTypeList(GetBlogTypeList event, Emitter<BlogState> emit) async {
    emit(BlogTypeListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const BlogTypeListFailed("No Network Connection!"));
    } else {
      try {
        List<BlogTypeModel> blogTypeList;
        blogTypeList = await coursiaRepository.getBlogTypeList();

        emit(BlogTypeListSuccess(blogTypeList: blogTypeList));
      } catch (e) {
        emit(BlogTypeListFailed(e.toString()));
      }
    }
  }

  _getBlogList(GetBlogList event, Emitter<BlogState> emit) async {
    emit(BlogListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const BlogListFailed("No Network Connection!"));
    } else {
      try {
        List<BlogModel> blogList;
        blogList = await coursiaRepository.getBlogList(event.blogTypeId);
        emit(BlogListSuccess(blogList: blogList));
      } catch (e) {
        emit(BlogListFailed(e.toString()));
      }
    }
  }
}
