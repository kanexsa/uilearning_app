abstract class RegisterEvent {
  RegisterEvent();
}

class UserNameEvents extends RegisterEvent {
  final String userName;

  UserNameEvents(this.userName);
}

class EmailEvents extends RegisterEvent {
  final String email;

  EmailEvents(this.email);
}

class PasswordEvents extends RegisterEvent {
  final String password;

  PasswordEvents(this.password);
}

class RePasswordEvents extends RegisterEvent {
  final String rePassword;

  RePasswordEvents(this.rePassword);
}
