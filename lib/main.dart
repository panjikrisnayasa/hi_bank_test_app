import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app.dart';
import 'package:hi_bank_test_app/app/network/network_config.dart';
import 'package:hi_bank_test_app/app/services/firebase_options.dart';
import 'package:http_proxy/http_proxy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeProxy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [
        NetworkConfig.provider.overrideWithValue(_networkConfig),
      ],
      child: const App(),
    ),
  );
}

Future<void> initializeProxy() async {
  final HttpProxy httpProxy = await HttpProxy.createHttpProxy();

  HttpOverrides.global = httpProxy;
}

const _networkConfig = NetworkConfig(
  apiScheme: String.fromEnvironment('API_SCHEME'),
  apiHost: String.fromEnvironment('API_HOST'),
);
