import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controller/cubit/app_cubit.dart';
import 'package:untitled4/controller/helper/bloc_observe.dart';
import 'package:untitled4/controller/helper/dio_helper.dart';

import 'view/screens/homeScreen.dart';

void main() async{
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (BuildContext context) => AppCubit()..getAvilableCars()
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3f50b5)),
        ),
        home:  HomeScreen(),
      ),
    );
  }
}

