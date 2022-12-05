import 'package:flutter/cupertino.dart';

abstract class HomeState {}

class InitializedScreen extends HomeState {
  final Widget screen;
  InitializedScreen(this.screen);
}

class ChangedScreen extends HomeState {
  final Widget screen;
  ChangedScreen(this.screen);
}
