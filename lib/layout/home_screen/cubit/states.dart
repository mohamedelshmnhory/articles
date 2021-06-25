abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeChangeBottomNavState extends HomeStates {}

class HomeLoadingHomeDataState extends HomeStates {}

class HomeSuccessHomeDataState extends HomeStates {}

class HomeErrorHomeDataState extends HomeStates {
  HomeErrorHomeDataState(this.error);
  String error;
}
