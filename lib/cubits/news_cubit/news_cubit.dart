import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/Models/news_model.dart';
import 'package:news/Repository/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final _newsRepo = NewsRepo();

  void getNews() async{
    try {
      emit(Newsloading());
      final res = await _newsRepo.fetchNews();
      final model = NewsModel.fromJson(res.data);
      emit(NewsSuccess(model));
    }catch(e){
      emit(NewsFailed());
    }
  }

}
