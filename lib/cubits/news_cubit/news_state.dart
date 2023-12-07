part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class Newsloading extends NewsState{}

class NewsSuccess extends NewsState{
  final NewsModel data;

  NewsSuccess(this.data);
}

class NewsFailed extends NewsState{}
