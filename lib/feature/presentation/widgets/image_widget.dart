import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lol_champions/common/app_colors.dart';

class ChampionImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  const ChampionImage(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageUrl})
      : super(key: key);

  _imageWidget(ImageProvider imageProvider) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.mainAccent,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
          const AssetImage('assets/images/no_img.png'),
        );
      },
    );
  }
}
