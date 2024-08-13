abstract class NewsAppStates{}
class NewsAppInitialState extends NewsAppStates{}
class ChangedNavBarIndexState extends NewsAppStates{}
class GettingBusinessDataLoadingState extends NewsAppStates{}
class GettingBusinessDataSuccessState extends NewsAppStates{}
class GettingBusinessDataErrorState extends NewsAppStates{
  String? error;
  GettingBusinessDataErrorState({error});
}
class GettingSportsDataLoadingState extends NewsAppStates{}
class GettingSportsDataSuccessState extends NewsAppStates{}
class GettingSportsDataErrorState extends NewsAppStates{
  String? error;
  GettingSportsDataErrorState({error});
}
class GettingScienceDataLoadingState extends NewsAppStates{}
class GettingScienceDataSuccessState extends NewsAppStates{}
class GettingScienceDataErrorState extends NewsAppStates{
  String? error;
  GettingScienceDataErrorState({error});
}
class SearchForArticlesLoadingState extends NewsAppStates{}
class SearchForArticlesSuccessState extends NewsAppStates{}
class SearchForArticlesErrorState extends NewsAppStates{
  String? error;
  SearchForArticlesErrorState({error});
}