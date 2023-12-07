import 'package:flutter/material.dart';
import 'package:news/Models/news_model.dart';
import 'package:news/Repository/news_repo.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({
    super.key,
    required this.article,
  });
  Article article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(
              article.urlToImage as String),
          width: MediaQuery.of(context).size.width,
          height: 280,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                  top: 20
              ),
              child: Column(
                children: [
                  Container(
                      height: 80,
                      width: 430,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 366,
                              height: 80,
                              child: Text(
                                article.title,
                                style: TextStyle(
                                    color: Color(0xff231F20),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      )),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image(
                          image:
                          AssetImage("assets/images/Ellipse 1.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        article.author as String,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            color: Color(0xff6D6265)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text( article.content,
                    style: TextStyle(
                        color: Color(0xff231F20),
                        fontFamily: 'Merriweather',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
