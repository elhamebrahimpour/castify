import 'package:castify/bloc/home_event.dart';
import 'package:castify/bloc/home_state.dart';
import 'package:castify/screens/home_screen.dart';
import 'package:castify/screens/on_boadring_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitializedScreen(OnBoardingScreen())) {
    on<StartPressed>(
      (event, emit) => emit(
        ChangedScreen(
          const HomeScreen(),
        ),
      ),
    );
  }
}
