abstract class ApplicationEvents {
  ApplicationEvents();
}

class TriggerAppEvent extends ApplicationEvents {
  final int index;

  TriggerAppEvent(this.index) : super();
}
