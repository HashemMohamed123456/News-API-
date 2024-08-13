import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_cubit.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_states.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
    SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsAppCubit(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
        builder:(context,state){
          return Scaffold(
              appBar: AppBar(
              title: const Text('Search'),
          actions: [
                  BlocConsumer<ChangeAppModeCubit,ChangeModeStates>(
                    listener: (context,state){},
                    builder: (context,state){
                      return  IconButton(onPressed:(){
                        ChangeAppModeCubit.get(context).changeAppMode();
                      },
                          icon:const Icon(Icons.brightness_4_outlined));
                    },
                  )],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: textFormFieldCustom(
                  keyboardType: TextInputType.text,
                validator: (value){
                if(value!.isEmpty){
                return 'Search should not be empty';
                }
                return null;
                },
                    onChanged: (String value){
                    NewsAppCubit.get(context).searchForArticles(value);
                    },
                controller:searchController,
                label: 'Search',
                prefix: Icons.search
                ),
              ),
           state is SearchForArticlesLoadingState?const Center(child:CircularProgressIndicator()):Expanded(
             child: ListView.separated(physics: const BouncingScrollPhysics(),itemBuilder:(context,index){
               return buildArticleItem(article: NewsAppCubit.get(context).search[index],context: context);
             }, separatorBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   height: 1,
                   width: double.infinity,
                   color: Colors.grey,
                 ),
               );
             }, itemCount:NewsAppCubit.get(context).search.length),
           )],
          ),
          );}
      ),
    );
}
}
