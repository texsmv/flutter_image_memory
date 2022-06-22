import 'package:flutter/material.dart';
import 'package:images_tips/app/image_list.dart';
import 'package:images_tips/app/menu.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';
import 'package:paulonia_image_service/paulonia_image_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PCacheImage.init();
  PImageService.settings(
    maxCacheSize: 100 * 1024 * 1024,
    maxImages: 20,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuView(),
    );
  }
}
