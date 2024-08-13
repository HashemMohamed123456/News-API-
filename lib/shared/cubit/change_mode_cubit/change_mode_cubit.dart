import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/change_mode_cubit/change_mode_states.dart';
class ChangeAppModeCubit extends Cubit<ChangeModeStates>{
  ChangeAppModeCubit():super(ChangeModeInitialState());
  static ChangeAppModeCubit get(context)=>BlocProvider.of<ChangeAppModeCubit>(context);
  bool isDark=false;
  void changeAppMode(){
      isDark=!isDark;
        emit(ChangedNewsAppModeState());
      }
}