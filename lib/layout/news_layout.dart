import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_cubit.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_states.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsAppCubit()..getBusinessData(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed:(){
                  navigateTo(context,SearchScreen());
                },
                    icon:const Icon(Icons.search)),
                BlocConsumer<ChangeAppModeCubit,ChangeModeStates>(
                  listener: (context,state){},
                  builder: (context,state){
                    return IconButton(onPressed:(){
                      ChangeAppModeCubit.get(context).changeAppMode();
                    },
                        icon:const Icon(Icons.brightness_4_outlined));
                  },
                ),
              ],
              title: const Text('News App'),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: NewsAppCubit.get(context).currentIndex,
              items:NewsAppCubit.get(context).items,
               onTap:(index){
                NewsAppCubit.get(context).onTapNavigationBar(index);
               },
            ),
          body:NewsAppCubit.get(context).screens[NewsAppCubit.get(context).currentIndex],);
        },

      ),
    );
  }
}
