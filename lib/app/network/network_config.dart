import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkConfig {
  const NetworkConfig({
    required this.apiScheme,
    required this.apiHost,
  });

  static final provider = Provider<NetworkConfig>(
    (ref) {
      throw UnimplementedError(
        'NetworkConfig is not provided in the main function',
      );
    },
  );

  final String apiScheme;

  final String apiHost;
}
