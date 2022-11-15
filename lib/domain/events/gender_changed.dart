import 'package:bloc_and_riverpod/domain/events/event.dart';

class GenderChanged extends Event {
  final String value;
  GenderChanged(this.value);
}
