# hi_bank_test_app

An app for Hi Bank technical test.

## Features
1. Sign in with Google
2. See post list
3. Search post
4. See account profile
5. Sign out

## Dependencies
1. [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management
2. [dio](https://pub.dev/packages/dio) for network
3. [freezed](https://pub.dev/packages/freezed) for immutable model
4. [flutter_localization](https://pub.dev/packages/flutter_localization) for localization
5. [firebase_core](https://pub.dev/packages/firebase_core) for Firebase setup
6. [firebase_auth](https://pub.dev/packages/firebase_auth) for Firebase authentication
7. [google_sign_in](https://pub.dev/packages/google_sign_in) to access Google Sign In
8. [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization

## How to Run

1. Clone project
2. Run `flutter pub get` to get all the dependencies
3. Run `flutter gen-l10n` for localizations
4. Add this to `additional run args`
```
--dart-define=API_SCHEME=https
--dart-define=API_HOST=jsonplaceholder.typicode.com
```
5. Run the app

## Screenshots, Screen Records, and APK
https://drive.google.com/drive/folders/1Suma0qGaYzg1hhQ3ZPMJB6gl7A3M2a5g?usp=sharing

## Flow coding explanation
https://youtu.be/AA0aXwv4wh8?si=719br1w6g4QP8hzg
