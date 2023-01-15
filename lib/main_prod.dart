import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  EnvConfig prodConfig = EnvConfig(
    appName: "Headline News",
    baseUrl: dotenv.env['BASE_URL'] ?? "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
