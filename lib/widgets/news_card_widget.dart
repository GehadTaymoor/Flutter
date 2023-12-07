import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Models/news_model.dart';
import 'package:news/Repository/news_repo.dart';
import 'package:news/Screens/news_screen.dart';
import 'package:news/cubits/news_cubit/news_cubit.dart';

class NewsCardWidget extends StatelessWidget {
  final Article article;
  NewsCardWidget({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.074),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NewsScreen(
                  article: article,
                )));
          },
          child: Container(
            height: 100,
            width: 366,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 48,
                          child: Text(article.title,
                              style: TextStyle(
                                  color: Color(0xff231F20),
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis)),
                        ),
                        Container(
                          width: 200,
                          height: 15,
                          child: Text(
                            article.title ?? "title not exist",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Color(0xff6D6265),
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.037,
                    ),
                    Image(
                        height: 80,
                        width: widthScreen * 0.26,
                        image: NetworkImage(article.urlToImage as String))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
