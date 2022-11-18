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
import 'package:logger/logger.dart';

class UserRegistering extends Bloc<Event, Map<String, Exception?>>
    with ChangeNotifier {
  final logger = Logger();
  UserRegistering(super.initialState) {
    on<NameChanged>((event, emit) {
      // Deep Copy 方法參考[這裡](https://stackoverflow.com/questions/21744480/clone-a-list-map-or-set-in-dart#answer-63768939)
      try {
        Name.fromString(event.value);
        emit({...state, 'name': null});
      } on NameRequired catch (exception) {
        emit({...state, 'name': exception});
      } on NameInvalid catch (exception) {
        emit({...state, 'name': exception});
      } catch (error) {
        logger.e(error);
        rethrow;
      }
    });

    on<GenderChanged>((event, emit) {
      try {
        Gender.fromString(event.value);
        emit({...state, 'gender': null});
      } on GenderInvalid catch (exception) {
        emit({...state, 'gender': exception});
      } catch (error) {
        logger.e(error);
        rethrow;
      }
    });

    on<PhoneNumberChanged>((event, emit) {
      try {
        PhoneNumber.fromString(event.value);
        emit({...state, 'phone_number': null});
      } on PhoneNumberRequired catch (exception) {
        emit({...state, 'phone_number': exception});
      } on PhoneNumberInvalid catch (exception) {
        emit({...state, 'phone_number': exception});
      } catch (error) {
        logger.e(error);
        rethrow;
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
