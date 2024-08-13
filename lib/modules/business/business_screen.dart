import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){
      },
      builder:(context,state){
         return (state is GettingBusinessDataLoadingState)?
         const Center(child:  CircularProgressIndicator())
             :ListView.separated(
           physics: const BouncingScrollPhysics(),
            itemBuilder:(context,index){
              return buildArticleItem(article:NewsAppCubit.get(context).businessTopics[index],context: context);
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
            }, itemCount:NewsAppCubit.get(context).businessTopics.length);
    }
    );
  }
}
