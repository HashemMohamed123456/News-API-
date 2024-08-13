import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){
        },
        builder:(context,state){
          return NewsAppCubit.get(context).sportsTopics.isEmpty?
          const Center(child:  CircularProgressIndicator())
              :ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index){
                return buildArticleItem(article:NewsAppCubit.get(context).sportsTopics[index],context: context);
              },
              separatorBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                );
              }, itemCount:NewsAppCubit.get(context).sportsTopics.length);
        }
    );
  }
}
