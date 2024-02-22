import 'package:flash/presentation/screens/default_screen.dart';
import 'package:flash/themes/app_themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flash/domain/routes/routes_services.dart';
import 'package:flash/domain/services/setup_service.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: 'assets/.env');
  setPathUrlStrategy();
  SetupService.setupLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteService.generateRoute,
        initialRoute: defaultScreen,
        supportedLocales: L10n.all,
        // locale: settingsController.locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        navigatorKey: SetupService.locator<NavigationService>().navigatorKey,
        theme: ThemesStyle.darkTheme(context),
        darkTheme: ThemesStyle.darkTheme(context),
        home: const DefaultScreen(),
      ),
    );
  }
}
