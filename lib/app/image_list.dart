import 'package:flutter/material.dart';
import 'package:images_tips/app/utils.dart';
import 'package:paulonia_image_service/source/pimage.dart';
// import 'package:paulonia_cache_image/global_values.dart';
// import 'package:paulonia_cache_image/paulonia_cache_image.dart';
// import 'package:paulonia_cache_image/paulonia_cache_image_unified.dart';
// import 'package:paulonia_cache_image/utils.dart';

class ImageListView extends StatefulWidget {
  final bool useImageService;
  const ImageListView({Key? key, required this.useImageService})
      : super(key: key);

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Cache Testing"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                String url = uiGetTestImageUrl(index + 1, 1024, 2048);
                return AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: widget.useImageService
                        ? PImage(
                            gsUrl: url,
                            fit: BoxFit.cover,
                          )
                        : Image(
                            image: NetworkImage(
                              url,
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
