import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class EventBusMessage{

  final int versiontype;

  EventBusMessage(this.versiontype);

}


class EventBusPerson{

  final String username;
  final bool islogin;

  EventBusPerson(this.username,this.islogin);
}


class EventBusToken{
  final String authorization;
  final String a;

  EventBusToken(this.authorization,this.a);

}