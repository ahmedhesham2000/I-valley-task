import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controller/cubit/app_cubit.dart';
import 'package:untitled4/core/size_utils.dart';
import 'package:untitled4/view/widgets/carDetailsWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool moreData = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        AppCubit.get(context).pageIndex++;
        if (AppCubit.get(context).availableCars.length <
            AppCubit.get(context).limitRowsOfPage) {
          moreData = false;
        }
        AppCubit.get(context).getAvilableCars();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppGetAvilableCarsErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xfff1f1f1),
                // selectedItemColor: Colors.white,
                selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),

                // unselectedItemColor: Colors.white.withOpacity(.60),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  // Respond to item press.
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'سيارات متاحة',
                    icon: Icon(Icons.car_crash, color: Color(0xff3f50b5)),
                  ),
                  BottomNavigationBarItem(
                    label: 'صفقات يوميه',
                    icon: Icon(Icons.calendar_month, color: Color(0xff3f50b5)),
                  ),
                  BottomNavigationBarItem(
                    label: 'بحث عام',
                    icon: Icon(Icons.search, color: Color(0xff3f50b5)),
                  ),
                  BottomNavigationBarItem(
                    label: 'اضافه اعلان',
                    icon: Icon(Icons.add, color: Color(0xff3f50b5)),
                  ),
                ].reversed.toList()),
            appBar: AppBar(
              title: const Text('السيارات المتاحة'),
              centerTitle: true,
              leading:
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),

            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == cubit.availableCars.length) {
                      return  Center(
                        child: moreData ?const CircularProgressIndicator():const Text("لا يوجد المزيد من البيانات"),
                      );
                    } else {
                      return CarDetailsWidget(
                        name: cubit.availableCars[index].MainTitle!,
                        price: cubit.availableCars[index].price!,
                        city: cubit.availableCars[index].cityName!,
                        model: cubit.availableCars[index].typeName!,
                        year: cubit.availableCars[index].model ?? '',
                        hours: cubit.availableCars[index].hours ?? '',
                        categoryType: cubit.availableCars[index].categoryType,
                        image: cubit.availableCars[index].mainImagePath!,
                        phoneNumber: cubit.availableCars[index].providerMobile!,
                      );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: cubit.availableCars.length + 1),
            ));
      },
    );
  }
}
