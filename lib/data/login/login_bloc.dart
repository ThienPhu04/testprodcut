
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginEvent {}
class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;
  LoginSubmitted(this.username, this.password);
}

abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) {
      if (event.username == "admin" && event.password == "123") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }
    });
  }
}
