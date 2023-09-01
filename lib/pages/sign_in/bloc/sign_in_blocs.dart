import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uilearning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:uilearning_app/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvents>(_emailEvent);

    on<PasswordEvents>(_passwordEvent);
  }

  void _emailEvent(EmailEvents events, Emitter<SignInState> emit) {
    print("my email is ${events.email}");
    emit(state.copyWith(email: events.email));
  }

  void _passwordEvent(PasswordEvents events, Emitter<SignInState> emit) {
    print("my password is ${events.password}");
    emit(state.copyWith(password: events.password));
  }
}
