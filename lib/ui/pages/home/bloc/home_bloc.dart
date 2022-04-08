import 'package:base_project/data/model/models.dart';
import 'package:base_project/data/repository/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository repository = UserRepository();
  HomeBloc() : super(HomeInitial()) {
    on<GetRecommendationData>((event, emit) async {
      emit(HomeLoading());
      try {
        ListUser data1 = await repository.getListUser("1");
        ListUser data2 = await repository.getListUser("2");
        List<ListUser> data = [data1, data2];
        emit(HomeSuccess(data));
      } catch (e) {
        emit(HomeFailed(e.toString()));
      }
    });
  }
}
