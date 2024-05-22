import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_alog_proj/provider/main_provider.dart';
import 'package:search_alog_proj/views/landing_view.dart';
import 'package:window_manager/window_manager.dart';

const double height = 700;
const double width = 700;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(width, height),
    center: false,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    windowButtonVisibility: true,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: MaterialApp(
        title: 'Algorithm Search Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LandingView(),
      ),
    );
  }
}
