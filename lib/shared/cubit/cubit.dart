import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/cubit/states.dart';
import '../network/remote/dio_helper/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit():super(NewsAppInitialState());
  static NewsAppCubit get(context)=>BlocProvider.of<NewsAppCubit>(context);
int currentIndex=0;
  List<BottomNavigationBarItem> items=[
    const BottomNavigationBarItem(icon:Icon(Icons.business),label:'Business'),
    const BottomNavigationBarItem(icon:Icon(Icons.sports),label:'Sports'),
    const BottomNavigationBarItem(icon:Icon(Icons.business),label:'Science'),
  ];
  void onTapNavigationBar(int index){
    currentIndex=index;
     if(index==1){
      getSportsData();
    }else if(index==2){
      getScienceData();
    }
    emit(ChangedNavBarIndexState());
  }
  List<Widget>screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic>businessTopics=[];
  List<dynamic>sportsTopics=[];
  List<dynamic>scienceTopics=[];
  List<dynamic>search=[];
  void getBusinessData(){
    emit(GettingBusinessDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apiKey':'328f31b573cb4068a0a28d61339d7225',
    }).then((value){
      print(value.data['articles']);
      //print(value.data['articles'][0][''].toString());
      businessTopics=value.data['articles'];
      print(businessTopics[0]['title']);
      emit(GettingBusinessDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GettingBusinessDataErrorState(error: error.toString()));
    });
  }
  void getSportsData(){
    emit(GettingSportsDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'sports',
      'apiKey':'328f31b573cb4068a0a28d61339d7225',
    }).then((value){
      //print(value.data['articles']);
      //print(value.data['articles'][0][''].toString());
      sportsTopics=value.data['articles'];
      print(sportsTopics[0]['title']);
      emit(GettingSportsDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GettingSportsDataErrorState(error: error.toString()));
    });
  }
  void getScienceData(){
    emit(GettingScienceDataLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'science',
      'apiKey':'328f31b573cb4068a0a28d61339d7225',
    }).then((value){
      print(value.data['articles']);
      //print(value.data['articles'][0][''].toString());
      scienceTopics=value.data['articles'];
      print(scienceTopics[0]['title']);
      emit(GettingScienceDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GettingScienceDataErrorState(error: error.toString()));
    });
  }
void searchForArticles(String value){
    emit(SearchForArticlesLoadingState());
    search=[];
    DioHelper.getData(url:'v2/everything', query:{
      'q':value,
      'apiKey':'328f31b573cb4068a0a28d61339d7225',
    }).then((value){
      search=value.data['articles'];
      emit(SearchForArticlesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchForArticlesErrorState());
    });
}
}