import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app/services/firebase_auth_service.dart';

class AppController {
  AppController(this._authService) : super();

  static final provider = Provider(
    (ref) => AppController(
      ref.watch(FirebaseAuthService.provider),
    ),
  );

  final FirebaseAuthService _authService;

  bool get isSignedIn {
    return _authService.isSignedIn;
  }
}
