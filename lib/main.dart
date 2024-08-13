import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/shared/bloc_observer/bloc_observer.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_cubit.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_states.dart';
import 'package:news/shared/network/remote/dio_helper/dio_helper.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChangeAppModeCubit()..changeAppMode(),
      child: BlocConsumer<ChangeAppModeCubit,ChangeModeStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,primary: Colors.deepOrange),
                useMaterial3: true,
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                    )
                ),
                scaffoldBackgroundColor: HexColor('333739'), floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
                appBarTheme:  AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 30
                  ),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.black
                  ),
                  backgroundColor: HexColor('333739'),
                  titleTextStyle:const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor:HexColor('333739'),
                    type:BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20,
                    unselectedItemColor: Colors.white
                ),
              ),
              themeMode:ChangeAppModeCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
              theme: ThemeData(
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                    )
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 30
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white
                  ),
                  backgroundColor: Colors.white,
                  titleTextStyle:TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    type:BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange,primary: Colors.deepOrange),
                useMaterial3: true,
              ),
              home: const NewsLayout()
          );
        },
      ),
    );
  }
}

