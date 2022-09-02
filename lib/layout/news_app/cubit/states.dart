import '../../../shared/cubit/states.dart';

abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}
class AppChangeModeState extends AppStates{}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates
{
  final String error;
  NewsGetSearchErrorState(this.error);
}
