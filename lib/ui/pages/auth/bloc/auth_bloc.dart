import 'package:base_project/data/model/models.dart';
import 'package:base_project/data/repository/repositories.dart';
import 'package:base_project/util/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository repository = UserRepository();
  AuthBloc() : super(AuthInitial()) {
    on<LoginUser>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.loginUser(event.jsonSend);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailed(Utility.handleErrorString(e.toString())));
      }
    });
    on<RegisterUser>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.registerUser(event.jsonSend);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailed(Utility.handleErrorString(e.toString())));
      }
    });
  }
}
