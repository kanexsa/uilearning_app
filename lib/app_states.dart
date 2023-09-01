class AppStates {
  int counter;

  AppStates({required this.counter});
}

class InitStates extends AppStates {
  //Üst sınıfı kalıtım alıp ilk değerini veriyoruz.
  InitStates() : super(counter: 12);
}
