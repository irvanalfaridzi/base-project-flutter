part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ListUser> data;

  const HomeSuccess(this.data);
}

class HomeFailed extends HomeState {
  final String error;
  const HomeFailed(this.error);
}
