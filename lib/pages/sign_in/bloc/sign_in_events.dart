abstract class SignInEvent {
  SignInEvent();
}

class EmailEvents extends SignInEvent {
  final String email;

  EmailEvents(this.email);
}

class PasswordEvents extends SignInEvent {
  final String password;

  PasswordEvents(this.password);
}
