part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppGetAvilableCarsLoadingState extends AppState {}

class AppGetAvilableCarsSuccessState extends AppState {}

class AppGetAvilableCarsErrorState extends AppState {
  final String error;

  AppGetAvilableCarsErrorState({required this.error});
}
