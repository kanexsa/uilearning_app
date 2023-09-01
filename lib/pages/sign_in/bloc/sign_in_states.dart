import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  //state değişimlerinde değerlerin değişmesi için.
  //farklı değerdeki nesneleri klonluyoruz.
  SignInState copyWith({String? email, String? password}) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }

  @override
  // TODO: implement props
  //ilgili alanların değişimlerinde güncelleme işlemini yapar.
  List<Object?> get props => [email, password];
}
