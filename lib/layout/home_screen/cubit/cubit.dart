import 'package:articles/layout/home_screen/cubit/states.dart';
import 'package:articles/models/home_model.dart';
import 'package:articles/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Home homeModel;

  void getHomeData() {
    emit(HomeLoadingHomeDataState());

    DioHelper().getHomeData().then((model) {
      homeModel = model;

      emit(HomeSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorHomeDataState(error.toString()));
    });
  }
}
