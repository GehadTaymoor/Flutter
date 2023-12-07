import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/news_cubit/news_cubit.dart';
import 'package:news/widgets/loading_widget.dart';
import 'package:news/widgets/newtorkError.dart';
import '../widgets/news_card_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is Newsloading) {
              return Center(child: ShimmerNewsCard());
            }

            if (state is NewsFailed) {
              return Center(
                  child: NetworkErrorMessage(
                message: 'Lost connection to the internet!',
              ));
            }

            if (state is NewsSuccess) {
              final data = state.data;
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 68,
                    color: Color(0xffE9EEFA),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        Text(
                          "News",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            fontFamily: 'Inter',
                            color: Color(0xff231F20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final article = data.articles[index];
                          return NewsCardWidget(
                            article: article,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: state.data.totalResults),
                  ),
                ],
              );
            }

            return Center(child: const Text("Internet connection lost !"));
          },
        ),
      ),
    );
  }
}
