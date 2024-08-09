import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hi_bank_test_app/app.dart';
import 'package:hi_bank_test_app/app/network/network_config.dart';
import 'package:http_proxy/http_proxy.dart';

void main() {
  initializeProxy();

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
  WidgetsFlutterBinding.ensureInitialized();
  final HttpProxy httpProxy = await HttpProxy.createHttpProxy();
  HttpOverrides.global = httpProxy;
}

const _networkConfig = NetworkConfig(
  apiScheme: String.fromEnvironment('API_SCHEME'),
  apiHost: String.fromEnvironment('API_HOST'),
);
