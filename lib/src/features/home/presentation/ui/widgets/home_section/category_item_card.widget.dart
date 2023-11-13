import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/features/category/domain/entities/category.entity.dart';

class CategoryItemCard extends StatelessWidget {
  final Category category;
  final double imageSize;

  const CategoryItemCard({
    Key? key,
    required this.category,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                category.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.fontFamily.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        );
      },
      imageUrl: category.icons?.firstOrNull?.url ?? '',
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
