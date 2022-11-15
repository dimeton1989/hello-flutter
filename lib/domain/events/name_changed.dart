import 'package:bloc_and_riverpod/domain/events/event.dart';

class NameChanged extends Event {
  String value;
  NameChanged(this.value);
}
