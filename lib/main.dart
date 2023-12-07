import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Screens/news_screen.dart';
import 'package:news/Screens/splash_screen.dart';
import 'package:news/cubits/news_cubit/news_cubit.dart';
import 'package:news/widgets/news_card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          useMaterial3: true
        ),
        home: SplashScreen(),
      ),
    );
  }
}
