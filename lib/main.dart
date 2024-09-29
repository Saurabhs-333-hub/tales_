import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tales/main_wrapper.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        checkerboardOffscreenLayers: true,
        checkerboardRasterCacheImages: true,
        debugShowCheckedModeBanner: false,
        scrollBehavior: CupertinoScrollBehavior(),
        home: MainWrapper(),
      ),
    );
  }
}
