import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uilearning_app/pages/register/bloc/register_events.dart';
import 'package:uilearning_app/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvents>(_userNameEvent);
    on<EmailEvents>(_emailEvent);
    on<PasswordEvents>(_passwordEvent);
    on<RePasswordEvents>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvents events, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: events.userName));
  }

  void _emailEvent(EmailEvents events, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: events.email));
  }

  void _passwordEvent(PasswordEvents events, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: events.password));
  }

  void _rePasswordEvent(RePasswordEvents events, Emitter<RegisterStates> emit) {
    emit(state.copyWith(rePassword: events.rePassword));
  }
}
