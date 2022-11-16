## 目錄結構
```txt
.
├── bloc_and_riverpod.dart
├── main.dart
└── user_registration
    └── domain
        ├── events
        │   ├── event.dart
        │   ├── gender_changed.dart
        │   ├── name_changed.dart
        │   └── phone_number_changed.dart
        ├── exceptions
        │   ├── gender_invalid.dart
        │   ├── identifier_invalid.dart
        │   ├── identifier_required.dart
        │   ├── name_invalid.dart
        │   ├── name_required.dart
        │   ├── phone_number_invalid.dart
        │   └── phone_number_required.dart
        ├── process_managers
        │   └── user_registering.dart
        └── value_objects
            ├── gender.dart
            ├── identifier.dart
            ├── name.dart
            └── phone_number.dart
```
