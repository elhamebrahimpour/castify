import 'package:castify/bloc/home_bloc.dart';
import 'package:castify/bloc/home_state.dart';
import 'package:castify/screens/main_screen.dart';
import 'package:castify/screens/on_boadring_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc,HomeState>(
          builder: ((context, state) {
            if (state is InitializedScreen) {
              return OnBoardingScreen();
            }
            if (state is ChangedScreen) {
              return const MainScreen();
            }
            return OnBoardingScreen();
          }),
        ),
      ),
    );
  }
}
