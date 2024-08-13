import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_states.dart';
import 'package:news/shared/network/local/cache_helper/cache_helper.dart';
import 'package:news/shared/network/local/keys/keys.dart';
class ChangeAppModeCubit extends Cubit<ChangeModeStates>{
  ChangeAppModeCubit():super(ChangeModeInitialState());
  static ChangeAppModeCubit get(context)=>BlocProvider.of<ChangeAppModeCubit>(context);
  bool isDark=false;
  void changeAppMode({bool? fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
    }
    else{
      isDark=!isDark;
      CacheHelper.putBool(key:SharedKeys.isDark, value:isDark);
    }
        emit(ChangedNewsAppModeState());
      }
}