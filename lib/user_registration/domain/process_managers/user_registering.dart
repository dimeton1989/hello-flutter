import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/user_registration/domain/events/event.dart';
import 'package:hello_flutter/user_registration/domain/events/name_changed.dart';
import 'package:hello_flutter/user_registration/domain/events/gender_changed.dart';
import 'package:hello_flutter/user_registration/domain/events/phone_number_changed.dart';
import 'package:hello_flutter/user_registration/domain/value_objects/gender.dart';
import 'package:hello_flutter/user_registration/domain/value_objects/name.dart';
import 'package:hello_flutter/user_registration/domain/value_objects/phone_number.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/name_required.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/name_invalid.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/gender_invalid.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/phone_number_required.dart';
import 'package:hello_flutter/user_registration/domain/exceptions/phone_number_invalid.dart';

class UserRegistering extends Bloc<Event, Map<String, Exception?>>
    with ChangeNotifier {
  UserRegistering(super.initialState) {
    on<NameChanged>((event, emit) {
      try {
        Name.fromString(event.value);
        state['name'] = null;
      } on NameRequired catch (error) {
        state['name'] = error;
        emit(state);
      } on NameInvalid catch (error) {
        state['name'] = error;
        emit(state);
      }
    });

    on<GenderChanged>((event, emit) {
      try {
        Gender.fromString(event.value);
        state['gender'] = null;
      } on GenderInvalid catch (error) {
        state['gender'] = error;
        emit(state);
      }
    });

    on<PhoneNumberChanged>((event, emit) {
      try {
        PhoneNumber.fromString(event.value);
        state['phone_number'] = null;
      } on PhoneNumberRequired catch (error) {
        state['phone_number'] = error;
        emit(state);
      } on PhoneNumberInvalid catch (error) {
        state['phone_number'] = error;
        emit(state);
      }
    });
  }
  @override
  void onChange(Change<Map<String, Exception?>> change) {
    super.onChange(change);
    notifyListeners();
  }

  bool get ready {
    if (state.isEmpty) return false;
    return !state.entries.any((mapEntry) => mapEntry.value != null);
  }
}
