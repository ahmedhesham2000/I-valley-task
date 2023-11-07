import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/model/carData.dart';

import '../../core/constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  int pageIndex = 1;
  int limitRowsOfPage=10;
  List<CarData> availableCars = [];
  void getAvilableCars ()async{

    emit(AppGetAvilableCarsLoadingState());
    await Dio().post(
        '${baseUrl}AvailableCars/GetAllAvilableCar',
      data: {
        "advertCityId":0,
        "advertTypeId": 2,
        "carBrandId": 0,
        "carTypeId": 0,
        "model": "",
        "priceFrom": 0.0,
        "priceTo": 0.0,
        "pageNumber": pageIndex,
        "rowsOfPage": limitRowsOfPage
      }
    ).then((value) {
      Iterable I = value.data;
      List<CarData> newData=List.from(I.map((e) => CarData.fromjson(e)));
      availableCars.addAll(newData);
      emit(AppGetAvilableCarsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetAvilableCarsErrorState(error: error.toString()));
    });
  }

}
